path = require 'path'
fs = require 'fs'

module.exports =
  extractName: (fileName)-> path.basename fileName, path.extname(fileName)
  normalizePath: (args...)-> path.normalize path.resolve(process.cwd(), args...)
  getFilesFrom: (folder)-> @extractName moduleFile for moduleFile in fs.readdirSync(@normalizePath(folder)) when fs.statSync(@normalizePath(folder, moduleFile)).isFile()
