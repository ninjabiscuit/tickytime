var TICKYTIME = TICKYTIME || {};

(function($, Modernizr, document, TICKYTIME) {

  // Markup-based unobtrusive comprehensive DOM-ready execution
  // The Garber Irish implementation (http://www.viget.com/inspire/extending-paul-irishs-comprehensive-dom-ready-execution/)

  TICKYTIME.UTIL = {
    exec: function( controller, action ) {
      var controllerObject = TICKYTIME[controller];
      //action = ( action === undefined ) ? "init" : action;

      if ( controller !== "" && controllerObject && typeof controllerObject[action] == "function" ) {
        controllerObject[action]();
      }
    },

    init: function() {
      var body = document.body,
          controller = body.id,
          action = body.getAttribute( "data-action" );

      TICKYTIME.rails = {
        action : action,
        controller : controller
      };

      TICKYTIME.UTIL.exec( "common", "init" );
      TICKYTIME.UTIL.exec( controller, "init" );
      TICKYTIME.UTIL.exec( controller, action );

      $(body).addClass('dom-ready');
    }
  };

  $( document ).ready( TICKYTIME.UTIL.init );


})(window.jQuery, Modernizr, document, window.TICKYTIME);