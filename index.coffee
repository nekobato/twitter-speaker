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
      console.log "Source:", data.text
      data.text.replace '/(http|https):\/\/(.+)\ /g', ''
      data.text.replace '/RT:\ @(\w+)\ /g', ''
      console.log "Speak:", data.text
      spawn 'bash', ['./speak.sh', data.text]
