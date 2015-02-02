
/* global jQuery, window */
(function($) {
  'use strict';
  return $.fn.pin = function(options) {
    var $container, $elm, $window, isPinned, scroll;
    options = options || {
      pinClass: 'jq-pinned'
    };
    $elm = this;
    $window = $(window);
    $container = null;
    isPinned = false;
    (function() {
      var _height, _width;
      _width = $elm.outerWidth();
      _height = $elm.outerHeight();
      $elm.wrap('<div style="display:block;"></div>');
      $container = $elm.parent();
      return options.top = $elm.offset().top;
    })();
    scroll = function() {
      var _height, _top, _width;
      _top = $window.scrollTop();
      if ((_top === options.top || _top > options.top) && !isPinned) {

        /*
         * pin
         */
        _width = $elm.outerWidth();
        _height = $elm.outerHeight();
        $container.width(_width);
        $container.height(_height);
        $elm.addClass(options.pinClass);
        isPinned = true;
      } else if ((_top === options.top || _top < options.top) && isPinned) {

        /*
         * unpin
         */
        $elm.removeClass(options.pinClass);
        isPinned = false;
      } else {
        return false;
      }
    };
    $window.bind('scroll', scroll);

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
