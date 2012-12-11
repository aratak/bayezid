assert = require('chai').assert

describe "requirements", ()->
  Bayezid = require "#{process.cwd()}/index.js"
  bayezid = undefined

  beforeEach (done)->
    bayezid = new Bayezid path: "./test/fixtures/dummyModules"
    bayezid.process()


