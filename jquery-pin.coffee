### global jQuery ###
do($=jQuery)->
  'use strict'

  $.fn.pin = (options)->
    options = options || {}
    $elm = @

    return @
