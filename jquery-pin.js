
/* global jQuery, window */
(function($) {
  'use strict';
  return $.fn.pin = function(options) {
    var $container, $elm, $window, isPinned, opt, scroll;
    opt = {};
    opt.pinClass = (options != null ? options.pinClass : void 0) || 'jq-pinned';
    opt.bottomClass = (options != null ? options.bottomClass : void 0) || 'jq-pinned--bottom';
    opt.container = (options != null ? options.container : void 0) || $('body');
    $elm = this;
    $window = $(window);
    $container = null;
    isPinned = false;
    (function() {
      $elm.wrap('<div style="display:block;"></div>');
      $container = $elm.parent();
      opt.top = $elm.offset().top;
      return opt.bottom = opt.container.offset().top + opt.container.outerHeight() - $elm.height();
    })();
    scroll = function() {
      var _height, _top, _width;
      _top = $window.scrollTop();
      if ((_top === opt.top || _top > opt.top) && _top < opt.bottom && !isPinned) {

        /*
         * pin
         */
        _width = $elm.outerWidth();
        _height = $elm.outerHeight();
        $container.css('max-width', _width);
        $container.css('height', _height);
        $elm.addClass(opt.pinClass);
        if ($elm.hasClass(opt.bottomClass)) {
          $elm.removeClass(opt.bottomClass);
        }
        isPinned = true;
      } else if ((_top === opt.top || _top < opt.top) && isPinned) {

        /*
         * header unpin
         */
        if ($elm.hasClass(opt.pinClass)) {
          $elm.removeClass(opt.pinClass);
        }
        if ($elm.hasClass(opt.bottomClass)) {
          $elm.removeClass(opt.bottomClass);
        }
        isPinned = false;
      } else if ((_top === opt.bottom || _top > opt.bottom) && isPinned) {

        /*
         * bottom unpin
         */
        $elm.addClass(opt.bottomClass);
        if ($elm.hasClass(opt.pinClass)) {
          $elm.removeClass(opt.pinClass);
        }
        isPinned = false;
      } else {
        return false;
      }
    };
    $window.bind('scroll', scroll);
    return this;
  };
})(jQuery);
