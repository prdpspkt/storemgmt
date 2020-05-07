App.progress = App.cable.subscriptions.create "ProgressChannel",
  connected: ->
    console.log("Connected to server")

  disconnected: ->
    console.log("Disconnected...")

  received: (data) ->
  	progress_message = data.response.progress_message
  	message = data.response.message
  	closed = data.response.closed
  	started = data.response.started
  	reload = data.response.reload
  	$(".progress_message").html(progress_message) if progresss_message?
    $(".progress_bar").show() if started?
    $(".progress_bar").hide() if closed?
    location.reload() if reload?