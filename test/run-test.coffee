assert = require('chai').assert

describe "#auto", ->
  Bayezid = require "#{process.cwd()}/index.js"
  bayezid = undefined

  beforeEach ->
    bayezid = new Bayezid path: "./test/fixtures/dummyModules"

  it "should get all results of modules", (done)->
    console.log bayezid.toAsync()
    assert.isTrue false
