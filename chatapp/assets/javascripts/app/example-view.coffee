define ['jquery', 'templates', 'amp/factory/ShortBus'], ($, templates, ShortBus) ->

  class ExampleView

    render: (element) ->
      chatDiv = ''
      $(element).append templates.example

      window.shortBus = ShortBus.getBus
        exchangeProviderHostname: "gts.openampere.com"
        exchangeProviderPort: 15677
        routingInfoHostname: "gts.openampere.com"
        routingInfoPort: 15677
        authenticationProviderHostname: "anubis.openampere.com"
        authenticationProviderPort: 15678
        fallbackTopoExchangeHostname: "rabbit.openampere.com"
        fallbackTopoExchangePort: 15676

      shortBus.subscribe({
        getEventType: ->
          return "ampjs.demo.chatapp"
        handle: (arg0, arg1)->
          oldHtml = $("#chatDiv").html()
          $("#chatDiv").html "#{oldHtml}<div><b>#{arg1['cmf.bus.message.sender_identity'].match(/CN=(.*),\sCN/)[1]}: </b>#{arg0.data}</div>"
        handleFailed: (arg0, arg1)->
          alert("Failure")
        }).then ->
        	$("#chatDiv").css({'background-color':'lightgreen'})
    	window.publish = ->
    		thingToPublish = $('#message').val()
    		$('#message').val("")
    		window.shortBus.publish({data: thingToPublish},"ampjs.demo.chatapp")

  	ExampleView