
/* global jQuery */
(function($) {
  'use strict';
  return $.fn.pin = function(options) {
    var $container, $elm;
    options = options || {};
    $elm = this;
    $container = null;
    (function() {
      var _height, _width;
      _width = $elm.outerWidth();
      _height = $elm.outerHeight();
      $elm.wrap('<div style="display:block;"></div>');
      return $container = $elm.parent();
    })();

    /*
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
     */
    return this;
  };
})(jQuery);
