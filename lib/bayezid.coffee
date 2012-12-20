_ = require 'underscore'
utils = require './utils'
async = require 'async'

Base = require './base'

class Bayezid extends Base
  constructor: ({ @rootFolder })->
    @nodes = for moduleName in utils.getFilesFrom(@rootFolder)
      require utils.normalizePath @rootFolder, moduleName

  toAsync: ->
    _.object ([node.name, [node.dependencies..., node.start]] for node in @nodes)

  run: (callback)->
    async.auto @toAsync(), callback


module.exports = Bayezid
