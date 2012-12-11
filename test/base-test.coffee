_ = require 'underscore'
assert = require('chai').assert

describe "#Base", ()->
  Base = require "#{process.cwd()}/lib/base"
  base = undefined

  beforeEach ->
    base = new Base

  describe "#extractName should extract name from filename", ->

    it "without extention", ->
      assert.equal base.extractName("filename"), "filename"

    it "with extention", ->
      assert.equal base.extractName("filename.ext"), "filename"
      assert.equal base.extractName("long-long-filename.ext"), "long-long-filename"
      assert.equal base.extractName("./relativepath/to/the/file.ext"), "file"
      assert.equal base.extractName("/absolute/path/to/the/file.ext"), "file"
      assert.equal base.extractName("./not/../../resolved/path/to/the/file.ext"), "file"

  describe "#normalizePath", ->

    beforeEach ->
      process._cwd = process.cwd
      process.cwd = -> "/qwe/qwe/qwe"

    afterEach ->
      process.cwd = process._cwd
      process._cwd = process.cwd

    it "should absolutase path", ->
      assert.equal base.normalizePath("./not/../../resolved/path/to/the/file.ext"), "/qwe/qwe/resolved/path/to/the/file.ext"

    it "should take into account absolute path", ->
      assert.equal base.normalizePath("/not/resolved/path/../to/the/file.ext"), "/not/resolved/to/the/file.ext"

    it "should not touch absolute path", ->
      assert.equal base.normalizePath("/absolute/path/to/the/file.ext"), "/absolute/path/to/the/file.ext"

    it "should add path to just filename", ->
      assert.equal base.normalizePath("file.ext"), "/qwe/qwe/qwe/file.ext"

  describe "#getFilesFrom", ->

    it "should return array of files", ->
      assert.isArray base.getFilesFrom('./test/fixtures/dummyModules')

    it "should return array of files", ->
      assert.include base.getFilesFrom('./test/fixtures/dummyModules'), "firstLevelModule"
      assert.include base.getFilesFrom('./test/fixtures/dummyModules'), "firstLevelModuleTwo"
      assert.include base.getFilesFrom('./test/fixtures/dummyModules'), "index"
