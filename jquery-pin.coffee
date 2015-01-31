### global jQuery ###
do($=jQuery)->
  'use strict'
  
  $.fn.pin = (options)->
    options = options || {}
    $elm = @
    $container = null
    # isPinned = false

    do->
      _width = $elm.outerWidth()
      _height = $elm.outerHeight()

      $elm.wrap '<div style="display:block;"></div>'
      $container = $elm.parent()
    
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
