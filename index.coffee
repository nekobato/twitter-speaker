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
      text = validate data.text
      console.log "Speak:", text

      url = "http://translate.google.com/translate_tts?ie=UTF-8&tl=ja&q=#{text}"
      tempo = '1.5'

      sh = spawn 'bash', ['./speak.sh', url]

      sh.stderr.setEncoding 'utf-8'
      sh.stderr.on 'data', (data) ->
        console.log 'stderr: ', data


validate = (text) ->
  encodeURI text
    .replace /https?:\/\/.+(\s|$)/gi, ""
    .replace /^RT\s@\d+:\s/gi, ""
    .replace /#\d+(\s|$)/gi, ""
