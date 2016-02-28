$ ->
  $('#incoming_form').hide()
	$('#save_incoming').on 'click', (event) ->
	  event.preventDefault()
	  event.stopPropagation()
	  $(@).hide()
	  $.ajax
      type: 'GET'
      url: '/brands'
    $('#incoming_form').show()
  
