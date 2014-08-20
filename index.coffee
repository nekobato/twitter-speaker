util = require('util')
twitter = require('twitter')
spawn = require('child_process').spawn
tokens = require('./tokens')

twit = new twitter
  consumer_key: tokens.consumer_key
  consumer_secret: tokens.consumer_secret
  access_token_key: tokens.access_token
  access_token_secret: tokens.access_secret


twit.stream 'user', {track: tokens.username}, (stream) ->
  stream.on 'data', (data) ->
    if data.text
      out = validate data.text
      console.log "Speak:", out
      spawn 'bash', ['./speak.sh', out]

validate = (text) ->
  text
    .replace /https?:\/\/.+\s/gi, ""
    .replace /RT:\s@\d+\s/gi, ""
