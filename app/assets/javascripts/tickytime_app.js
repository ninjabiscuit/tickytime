var TICKYTIME = TICKYTIME || {};

(function($, Modernizr, document, TICKYTIME) {

  TICKYTIME.common = {
    "init": function() {

    }
  };

  TICKYTIME.lessons = {
    "index" : function() {
      document.querySelector("#lessons_timeframe_form")
        .addEventListener("change", function(){
          this.submit();
        }, true);
    }
  };

})(window.jQuery, Modernizr, document, TICKYTIME);