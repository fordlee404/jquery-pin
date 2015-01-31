do($=jQuery)->
  'use strict'

  $.fn.pin = (options)->
    options = options || {}
    $elm = $(@)
    console.log $elm

    return @
