jQuery(document).on 'turbolinks:load', ->
  messages_element = $('#messages')
  App.chat_rooms = App.cable.subscriptions.create {
    channel: "ChatRoomsChannel"
    chat_room_id: messages_element.data('chat-room-id')
  },
  connected: ->
    console.log("I am connected")
  disconnected: ->
  received: (data) ->
    messages_element.prepend data['message']
  send_message: (message, chat_room_id) ->
    @perform 'send_message', message: message, chat_room_id: chat_room_id

  $('#new_message').submit (e) ->
    $this = $(this)
    textarea = $this.find('#message_body')
    message_attachment = $this.find('#message_attachment')
    if !message_attachment.val()
      if $.trim(textarea.val()).length > 1
        App.chat_rooms.send_message textarea.val(), messages_element.data('chat-room-id')
        textarea.val('')
      e.preventDefault()
      return false