_ = require 'underscore'
assert = require('chai').assert

describe "#BaseAssociation", ()->
  BaseAssociation = require "#{process.cwd()}/lib/baseAssociation"

  describe "extend basic object", ->
    class A extends BaseAssociation
      theMethod: ()-> 'association method value'
    obj = { 1: 1, 2: 2, 3: 3 }
    extendedObj = undefined

    beforeEach ->
      extendedObj = A.create(obj)

    it "should extend existing object", ->
      assert.deepEqual extendedObj, obj

  describe "additional methods", ->
    duckObj = {a:1, b: 2, c: 3}
    class DuckClass extends BaseAssociation
      theMethod: ()-> @
    duckAssociation = undefined

    beforeEach ->
      duckAssociation = DuckClass.create(duckObj)

    it "should add methods from child object", ->
      assert.ok duckAssociation.theMethod()

    it "methods should have object as this", ->
      assert.deepEqual duckAssociation.theMethod(), duckObj

  describe "array as a basic object", ->
    class DuckClass extends BaseAssociation
      theMethod: ()-> @
    duckObj = undefined
    duckAssociation = undefined

    describe "an empty array", ->
      beforeEach ->
        duckObj = []
        duckAssociation = DuckClass.create(duckObj)

      it "should extend empty array", ->
        assert.deepEqual duckAssociation, duckObj

      it "should have additional methods", ->
        assert.isFunction duckAssociation.theMethod

      it "additional methods should bind basic object", ->
        assert.deepEqual duckAssociation.theMethod(), duckObj

    describe "not empty array", ->
      beforeEach ->
        duckObj = [5,4,3,2,1,0]
        duckAssociation = DuckClass.create(duckObj)

    describe "enumeration", ->
      beforeEach ->
        duckObj = [5,4,3,2,1,0]
        duckAssociation = DuckClass.create(duckObj)

      it "should have a length", ->
        assert.lengthOf duckAssociation, 6, "association has length of 6"

      it "should be enumerable for a underscore", ->
        assert.deepEqual [6,5,4,3,2,1], _.map(duckAssociation, (i)-> i+1)

      it "should be iteratable for for..in", ->
        assert.include([5,4,3,2,1,0], i) for i in duckAssociation
