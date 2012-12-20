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

  describe "#toAsync", ->
    toAsync = undefined

    beforeEach ->
      toAsync = bayezid.toAsync()

    it "should have method toAsync", ->
      assert.isFunction bayezid.toAsync

    it "should have chain length as nodes length", ->
      assert.lengthOf _.keys(toAsync), 3

    it "should have array of dependencies as a first element of the value", ->
      it "#index", -> assert.lengthOf toAsync['index'], 3
      it "#firstLevelModule", -> assert.lengthOf toAsync['firstLevelModule'], 1
      it "#firstLevelModuleTwo", -> assert.lengthOf toAsync['firstLevelModuleTwo'], 2


    describe "should have array of dependencies as a first element of the value", ->
      it "#index", ->
        assert.equal toAsync['index'][0], 'firstLevelModule'
        assert.equal toAsync['index'][1], 'firstLevelModuleTwo'
      it "#firstLevelModuleTwo", ->
        assert.equal toAsync['firstLevelModuleTwo'][0], 'firstLevelModule'

    describe "should have start function as a last element of the value", ->
      it "#index", ->
        assert.isFunction _.last(toAsync['index'])
      it "#firstLevelModule", ->
        assert.isFunction _.last(toAsync['firstLevelModule'])
      it "#firstLevelModuleTwo", ->
        assert.isFunction _.last(toAsync['firstLevelModuleTwo'])

  describe "#run", ->
    result = undefined

    beforeEach ->
      bayezid = new Bayezid rootFolder: './test/fixtures/dummyModules'

    it "callback should receive null-error as a first argument", (done)->
      bayezid.run done

    describe "callback should receive key-value with a result of each module", ->

      it "#firstLevelModule", (done)->
        bayezid.run (err, results)->
          assert.property results, 'firstLevelModule'
          done()

      it "#firstLevelModuleTwo", (done)->
        bayezid.run (err, results)->
          assert.property results, 'firstLevelModuleTwo'
          done()

      it "#index", (done)->
        bayezid.run (err, results)->
          assert.property results, 'index'
          done()
