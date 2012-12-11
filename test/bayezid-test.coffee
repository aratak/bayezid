_ = require 'underscore'
assert = require('chai').assert

describe "#Bayezid", ()->
  Bayezid = require "#{process.cwd()}/lib/bayezid"
  bayezid = undefined

  describe "basics", ->

    beforeEach ->
      bayezid = new Bayezid(rootFolder: './test/fixtures/dummyModules')

    it "should be an object", ->
      assert.isObject bayezid


  describe "#nodes", ->

    it "should have array of nodes", ->
      assert.isArray bayezid.nodes

    it "should have all files from root folder", ->
      assert.lengthOf bayezid.nodes, 3

    it "should have node for each file from root folder", ->
      assert.include (node.name for node in bayezid.nodes), "firstLevelModule"
      assert.include (node.name for node in bayezid.nodes), "firstLevelModuleTwo"
      assert.include (node.name for node in bayezid.nodes), "index"

    it "node should have dependencies", ->
      assert.property node, 'dependencies' for node in bayezid.nodes

  describe "toAsync", ->
    toAsync = undefined

    beforeEach ->
      toAsync = bayezid.toAsync()


    it "should have method toAsync", ->
      assert.isFunction bayezid.toAsync

    it "should have chain length as nodes length", ->
      assert.lengthOf _.keys(toAsync), 3

    it "should have array of dependencies as a first element of the value", ->
      assert.deepEqual toAsync['index'][0], ['firstLevelModule', 'firstLevelModuleTwo']
      assert.deepEqual toAsync['firstLevelModule'][0], []
      assert.deepEqual toAsync['firstLevelModuleTwo'][0], ['firstLevelModule']

    it "should have start function as a second element of the value", ->
