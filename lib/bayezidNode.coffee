Base = require './base'
BayezidNodeAssociation = require './bayezidNodeAssociation'

class BayezidNode extends Base
  constructor: ({ @nodeFileName, @bayezidModule })->
    @_module = require @filePath()
    @name = @extractName(@nodeFileName)
    @start = @_module.start
    @dependencies = BayezidNodeAssociation.create(dependency for dependency in @_module.dependencies)
  filePath: -> @normalizePath(@bayezidModule.rootFolder, @nodeFileName)

module.exports = BayezidNode
