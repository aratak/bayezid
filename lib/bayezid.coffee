path = require 'path'

class NestedModules
  constructor: ({ @path })->


class Bayezid
  constructor: ({ path, rootFolder })->
    @rootFolder = rootFolder or process.cwd()
    @path = path.normalize path.resolve rootFolder, path
    @modules = new NestedModules({ @path })


module.exports = Bayezid
