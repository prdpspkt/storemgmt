App.progress = App.cable.subscriptions.create "ProgressChannel",
  connected: ->
    console.log("Connected to server")

  disconnected: ->
    console.log("Disconnected...")

  received: (data) ->
  	($(".progress_message").html(data.response.message) if data.response.message?
    $(".progress_bar").show() if data.response.started?
    $(".progress_bar").hide() if data.response.closed?
    location.reload() if data.response.closed?) if data.response?