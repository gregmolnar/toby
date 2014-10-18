# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#new_password').on "submit", (e) ->
    GibberishAES.size(192);
    key = $('#key').val()
    $(this).find('#password_username, #password_password, #password_comment').each ->
      el = $(this)
      el.val(GibberishAES.enc(el.val(), key))
  $('#show').on "click", (e) ->
    GibberishAES.size(192);
    key = $('#key').val()
    $(".edit_password").find('#password_username, #password_password, #password_comment').each ->
      el = $(this)
      el.val(GibberishAES.dec(el.val(), key))
