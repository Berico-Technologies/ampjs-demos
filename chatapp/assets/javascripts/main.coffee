window.loggingLevel = 'all'
require
  urlArgs: "b=#{(new Date()).getTime()}"
  paths:
    amp: 'vendor/managed/ampjs/dist/amp'
    i18n: 'vendor/managed/requirejs-i18n/i18n'
    domReady: 'vendor/managed/requirejs-domready/domReady'
    underscore: 'vendor/managed/underscore-amd/underscore'
    stomp: 'vendor/managed/stomp-websocket/dist/stomp'
    flog: 'vendor/managed/flog/flog'
    uuid: 'vendor/managed/node-uuid/uuid'
    sockjs: 'vendor/managed/sockjs/sockjs'
    jquery: 'vendor/managed/jquery/jquery'
    LRUCache: 'vendor/managed/node-lru-cache/lib/lru-cache'
  shim:
    'stomp':
      exports: 'Stomp'
    'sockjs':
      exports: 'SockJS'
    'uuid':
      exports: 'uuid'
    'jquery':
      exports: 'jquery'
    'LRUCache':
      exports: 'LRUCache'
  , ['app/example-view']
  , (ExampleView) ->
    view = new ExampleView()
    view.render('body')