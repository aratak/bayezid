_ = require 'underscore'
path = require 'path'
# wrench = require 'wrench'
# fs = require 'fs'
# async = require 'async'

Base = require './base'
BayezidModule = require './bayezidModule'
BayezidNode = require './bayezidNode'

# class Bayezid extends Base
#   constructor: ->


# class BayezidModule
#   constructor: ({ @name, modulePath })->
#     @_module = require normalizePath modulePath, @name
#     @dependencies = @_module.dependencies
#     @start = @_module.start
#   toAsync: -> [@name, [@dependencies, @start]]

# class Bayezid
#   initializeModules: (_path=@path)->
#     @modules = for moduleName in wrench.readdirSyncRecursive(_path) when fs.statSync(normalizePath(_path, moduleName)).isFile()
#       new BayezidModule({ name: moduleName, modulePath: @path })

#   constructor: ({ path: _path, rootFolder })->
#     @rootFolder = rootFolder or process.cwd()
#     @path = normalizePath(rootFolder, _path)
#     @initializeModules()

#   moduleNames: -> m.name for m in @modules
#   toAsync: -> _.object(module.toAsync() for module in @modules)
#   run: (cb)-> async.auto @toAsync(), cb

# module.exports = Bayezid
