### global jQuery, window ###
do($=jQuery)->
  'use strict'
  
  $.fn.pin = (options)->
    options = options || {
      pinClass: 'jq-pinned'
    }
    $elm = @
    $window = $(window)
    $container = null
    isPinned = false

    do->
      # set container
      _width = $elm.outerWidth()
      _height = $elm.outerHeight()

      $elm.wrap '<div style="display:block;"></div>'
      $container = $elm.parent()

      # set data
      options.top = $elm.offset().top;

    scroll = ->
      _top = $window.scrollTop()

      if (_top is options.top or _top > options.top) and not isPinned
        # pin
        $elm.addClass options.pinClass

        isPinned = true
        return
      else if (_top is options.top or _top < options.top) and isPinned
        # unpin
        $elm.removeClass options.pinClass

        isPinned = false
        return
      else
        return false

    $window.bind 'scroll',scroll
    
    ###
    refreshContainer = ->
      _width = $elm.outerWidth()
      _height = $elm.outerHeight()
      $container.css 'width',_width
      $container.css 'height',_height
      return

    $window = $(window)
    $window.resize ->
      if isPinned
        refreshContainer()
    ###

    return @
