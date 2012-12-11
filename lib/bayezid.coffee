_ = require 'underscore'
# path = require 'path'
# wrench = require 'wrench'
# fs = require 'fs'
# async = require 'async'

Base = require './base'

class Bayezid extends Base
  constructor: ({ @rootFolder, @callback })->
    @nodes = for moduleName in @getFilesFrom(@rootFolder)
      require @normalizePath @rootFolder, moduleName

  toAsync: ->
    _.object ([node.name, [node.dependencies, node.start]] for node in @nodes)

  run: ->
    async.auto @toAsync()


module.exports = Bayezid
