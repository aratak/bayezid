_ = require 'underscore'
utils = require './utils'
async = require 'async'

Base = require './base'

class Bayezid extends Base
  constructor: ({ @rootFolder })->
    @nodes = for moduleName in utils.getFilesFrom(@rootFolder)
      require utils.normalizePath @rootFolder, moduleName

  _toAsync: ->
    _.object ([node.name, [node.dependencies..., node.start]] for node in @nodes)

  run: (opts..., callback)->
    params = _.clone @_toAsync()
    params['init'] =[(cb)-> cb(null, opts[0]) ]
    async.auto params, callback


module.exports = Bayezid
