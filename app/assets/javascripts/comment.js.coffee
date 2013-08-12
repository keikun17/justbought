jQuery ->
  $('.comment-js').click (e) ->
    e.preventDefault()
    target = "#post-" + $(e.target).data('post') + '-comment'
    $(target).toggle()
