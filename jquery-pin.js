(function($) {
  'use strict';
  return $.fn.pin = function(options) {
    var $elm;
    options = options || {};
    $elm = $(this);
    console.log($elm);
    return this;
  };
})(jQuery);
