path = require 'path'

class Base
  @delegate: (methodName, {to: objectName})->
    @::[methodName] = (args...)-> @[objectName][methodName](args...)
  extractName: (fileName)-> path.basename fileName, path.extname(fileName)
  normalizePath: (args...)-> path.normalize path.resolve(args...)

module.exports = Base
