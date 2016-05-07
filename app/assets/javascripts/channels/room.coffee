App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Method này sẽ được gọi khi đã kết nối với RoomChannel.

  disconnected: ->
    # Method này sẽ được gọi khi đã kết thúc kết nối với RoomChannel.

  received: (data) ->
    $('#messages').append data['message']
    #Show messges khi nhận dữ liệu từ server trả về.

  speak: (message) ->
    @perform 'speak', message: message
    # Dùng để thông báo với server là có dữ liệu truyền lên.

  $(document).on 'keypress', '#chat-speak', (event) ->
    if event.keyCode is 13 # return = send
      App.room.speak event.target.value, 
      event.target.value = ""
      event.preventDefault()