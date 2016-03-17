!function($) {
  'use strict';

  $("#fullpage").fullpage({
    controlArrows: false,
    paddingTop: '80px',
    fixedElements: '#dreiradfahrer-navigation',
    animateAnchor: false,
    loopHorizontal: false,
    slidesNavigation: true,
    slidesNavPosition: 'bottom',
    navigation: true,
    navigationPosition: 'left',
    navigationTooltips: ['Joachim', 'Noah', 'Sandro'],
    showActiveTooltip: false,
    autoScrolling: true,
    scrollOverflow: true,
  });

}(window.jQuery);
