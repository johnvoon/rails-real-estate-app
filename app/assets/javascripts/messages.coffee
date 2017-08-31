$(document).on "turbolinks:load", ->
  $("#new-message").on "click", (e) ->
    $(this).submit()