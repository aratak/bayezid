_ = require 'underscore'
path = require 'path'
wrench = require 'wrench'
fs = require 'fs'

normalizePath = (args...)-> path.normalize path.resolve(args...)

class BayezidModule
  constructor: ({ @name, modulePath })->
    @_module = require normalizePath modulePath, @name
    @dependencies = @_module.dependencies
    @start = @_module.start

class Bayezid
  initializeModules: (_path=@path)->
    @modules = for moduleName in wrench.readdirSyncRecursive(_path) when fs.statSync(normalizePath(_path, moduleName)).isFile()
      new BayezidModule({ name: moduleName, modulePath: @path })

  constructor: ({ path: _path, rootFolder })->
    @rootFolder = rootFolder or process.cwd()
    @path = normalizePath(rootFolder, _path)
    @initializeModules()

  moduleNames: -> m.name for m in @modules

module.exports = Bayezid
