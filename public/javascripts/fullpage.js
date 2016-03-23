!function($) {
  'use strict';

  $("#fullpage").fullpage({
    controlArrows: false,
    paddingTop: '80px',
    fixedElements: '#dreiradfahrer-navigation',
    animateAnchor: false,
    animateSlideAnchor: false,
    loopHorizontal: false,
    slidesNavigation: true,
    slidesNavPosition: 'bottom',
    navigation: true,
    navigationPosition: 'left',
    navigationTooltips: true,
    showActiveTooltip: false,
    autoScrolling: true,
    scrollOverflow: true,
  });

}(window.jQuery);
