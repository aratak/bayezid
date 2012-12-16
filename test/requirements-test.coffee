assert = require('chai').assert

describe "requirements", ()->
  Bayezid = require "#{process.cwd()}/index.js"
  bayezid = undefined

  beforeEach (done)->
    bayezid = new Bayezid path: "./test/fixtures/dummyModules"
    done()

  it "should find all modules", (done)->
    assert.deepEqual [ 'firstLevelModule.coffee', 'firstLevelModuleTwo.coffee', 'index.coffee', 'secondLevel/index.coffee', 'secondLevel/secondLevelModule.coffee' ], bayezid.moduleNames()
    done()

  it "just a test", ->
    BayezidModule = require "#{process.cwd()}/lib/bayezidModule"
    bm = new BayezidModule
      rootFolder: "./test/fixtures/dummyModules"
