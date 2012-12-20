_ = require 'underscore'
assert = require('chai').assert

describe "#utils", ()->
  utils = require "#{process.cwd()}/lib/utils"


  describe "#extractName should extract name from filename", ->

    it "without extention", ->
      assert.equal utils.extractName("filename"), "filename"

    it "with extention", ->
      assert.equal utils.extractName("filename.ext"), "filename"
      assert.equal utils.extractName("long-long-filename.ext"), "long-long-filename"
      assert.equal utils.extractName("./relativepath/to/the/file.ext"), "file"
      assert.equal utils.extractName("/absolute/path/to/the/file.ext"), "file"
      assert.equal utils.extractName("./not/../../resolved/path/to/the/file.ext"), "file"

  describe "#normalizePath", ->

    beforeEach ->
      process._cwd = process.cwd
      process.cwd = -> "/qwe/qwe/qwe"

    afterEach ->
      process.cwd = process._cwd
      process._cwd = process.cwd

    it "should absolutase path", ->
      assert.equal utils.normalizePath("./not/../../resolved/path/to/the/file.ext"), "/qwe/qwe/resolved/path/to/the/file.ext"

    it "should take into account absolute path", ->
      assert.equal utils.normalizePath("/not/resolved/path/../to/the/file.ext"), "/not/resolved/to/the/file.ext"

    it "should not touch absolute path", ->
      assert.equal utils.normalizePath("/absolute/path/to/the/file.ext"), "/absolute/path/to/the/file.ext"

    it "should add path to just filename", ->
      assert.equal utils.normalizePath("file.ext"), "/qwe/qwe/qwe/file.ext"

  describe "#getFilesFrom", ->

    it "should return array of files", ->
      assert.isArray utils.getFilesFrom('./test/fixtures/dummyModules')

    it "should return array of files", ->
      assert.include utils.getFilesFrom('./test/fixtures/dummyModules'), "firstLevelModule"
      assert.include utils.getFilesFrom('./test/fixtures/dummyModules'), "firstLevelModuleTwo"
      assert.include utils.getFilesFrom('./test/fixtures/dummyModules'), "index"
