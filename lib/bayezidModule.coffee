fs = require 'fs'
async = require 'async'
Base = require './base'
BayezidNodeAssociation = require './bayezidNodeAssociation'

class BayezidModule extends Base
  toAsync: (args...)-> @bayezidNodes.toAsync(args...)
  findNode: (args...)-> @bayezidNodes.findNode(args...)
  findAllModuleFiles: ->
    @extractName moduleFile for moduleFile in fs.readdirSync(@rootFolder) when fs.statSync(@normalizePath(@rootFolder, moduleFile)).isFile()
  constructor: ({ @rootFolder, @bayezid })->
    @bayezidNodes = BayezidNodeAssociation.create(@findAllModuleFiles(), @)
  run: -> async.auto @toAsync()



module.exports = BayezidModule
