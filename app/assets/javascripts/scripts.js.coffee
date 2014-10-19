# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#verify').on "click", (e) ->
    $.ajax
      method: 'post'
      url:'/passwords/verify'
      data: {password: $('#key').val()}
      complete: (response, headers, xhr) ->
        if response.status == 200
          window.key = $('#key').val()
        else
          if response.status == 401
            m = 'Wrong password'
          else
            m = 'An error occured'
          $('#verify').after($('<div />').attr(class: 'alert alert-danger').text(m).show().delay(5000).fadeOut())
  $('#new_password').on "submit", (e) ->
    if window.key?
      GibberishAES.size(192);
      $('#new_password').find('#password_username, #password_password, #password_comment').each ->
        el = $(this)
        el.val(GibberishAES.enc(el.val(), key))
    else
      $('#verify').after($('<div />').attr(class: 'alert alert-danger').text("Enter your password first").show().delay(5000).fadeOut())
      e.preventDefault()
      e.stopPropagation()
  $('#show').on "click", (e) ->
    key = $('#key').val()
    $.ajax
      method: 'post'
      url:'/passwords/verify'
      data: {password: key}
      complete: (response, headers, xhr) ->
        if response.status == 200
          GibberishAES.size(192);
          $(".edit_password").find('#password_username, #password_password, #password_comment').each ->
            el = $(this)
            el.val(GibberishAES.dec(el.val(), key))
        else
          if response.status == 401
            m = 'Wrong password'
          else
            m = 'An error occured'
          $('#show').after($('<div />').attr(class: 'alert alert-danger').text(m).show().delay(5000).fadeOut())
      # success: (response, headers, xhr) ->
      #   GibberishAES.size(192);
      #   $(".edit_password").find('#password_username, #password_password, #password_comment').each ->
      #     el = $(this)
      #     el.val(GibberishAES.dec(el.val(), key))
      # error: (response, headers, xhr) ->
      #   if response.status == 401
      #     m = 'Wrong password'
      #   else
      #     m = 'An error occured'
      #   $('#show').after($('<div />').attr(class: 'alert alert-danger').text(m).show().delay(5000).fadeOut())
