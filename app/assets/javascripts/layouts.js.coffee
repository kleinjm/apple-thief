$(document).ready ->

  # show the alert message if there is a notice
  if $('.notice').html().length > 0
    $('#alert-message, #overlay').fadeIn(500)
  if $('.alert').html().length > 0
    $('#alert-message, #overlay').fadeIn(500)

  # hide alert message when close is clicked
  $('#alert-message button').on "click", () ->
    $('#alert-message, #overlay').fadeOut(500)

  # close the message if the user hasn't closed it in the set time
  setTimeout (->
    $("#alert-message, #overlay").fadeOut "slow"
  ), 3000