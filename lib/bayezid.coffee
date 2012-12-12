_ = require 'underscore'
path = require 'path'
wrench = require 'wrench'
fs = require 'fs'

normalizePath = (args...)-> path.normalize path.resolve(args...)

class BayezidModule
  constructor: ({ @modulePath })->
    @_module = require(@modulePath)
    @dependencies = @_module.dependencies
    @start = @_module.start

class Bayezid
  initializeModules: (_path=@path)->
    @modules = for modulePath in wrench.readdirSyncRecursive(_path) when fs.statSync(normalizePath(_path, modulePath)).isFile()
      new BayezidModule({ modulePath })

  constructor: ({ path: _path, rootFolder })->
    @rootFolder = rootFolder or process.cwd()
    @path = normalizePath(rootFolder, _path)
    @initializeModules()


module.exports = Bayezid
