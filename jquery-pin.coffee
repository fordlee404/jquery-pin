### global jQuery, window ###
do($=jQuery)->
  'use strict'
  
  $.fn.pin = (options)->
    opt = {}
    opt.pinClass = options?.pinClass or 'jq-pinned'
    opt.bottomClass = options?.bottomClass or 'jq-pinned--bottom'
    opt.container = options?.container or $('body')

    $elm = @
    $window = $(window)
    $container = null
    isPinned = false

    do->
      $elm.wrap '<div style="display:block;"></div>'
      $container = $elm.parent()

      # set data
      opt.top = $elm.offset().top;
      opt.bottom = opt.container.offset().top+opt.container.outerHeight()-$elm.height()
      
    scroll = ->
      _top = $window.scrollTop()

      if (_top is opt.top or _top > opt.top) and _top<opt.bottom and not isPinned
        ###
        # pin
        ###
        # set container width and height
        _width = $elm.outerWidth()
        _height = $elm.outerHeight()
        $container.css 'max-width',_width
        $container.css 'height',_height

        # add class
        $elm.addClass opt.pinClass

        # remove class
        $elm.removeClass opt.bottomClass if $elm.hasClass opt.bottomClass

        isPinned = true
        return
      else if (_top is opt.top or _top < opt.top) and isPinned
        ###
        # header unpin
        ###

        # remove class
        $elm.removeClass opt.pinClass if $elm.hasClass opt.pinClass
        $elm.removeClass opt.bottomClass if $elm.hasClass opt.bottomClass

        isPinned = false
        return
      else if (_top is opt.bottom or _top > opt.bottom) and isPinned
        ###
        # bottom unpin
        ###

        # add class
        $elm.addClass opt.bottomClass

        # remove class
        $elm.removeClass opt.pinClass if $elm.hasClass opt.pinClass

        isPinned = false
        return
      else
        return false

    $window.bind 'scroll',scroll

    return @
