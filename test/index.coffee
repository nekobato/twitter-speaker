'use strict'

assert = require('assert')
path = require('path')

describe 'twitter-speaker', ->

  this.timeout(10000);

  script = require '../'

  it 'check validate', (done) ->
    validated = script.validate("test http://twitter.com/ test")
    console.log validated
    assert.equal validated, "test  test"
    done()
