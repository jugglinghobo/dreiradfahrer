var WorldMap = function() {

  var accessToken = 'pk.eyJ1IjoiZHJlaXJhZGZhaHJlciIsImEiOiJjaWtoYWE1c3AwMDF5dzhsczFiaTU1Zm5kIn0.9oZmsOhe2xy-qG6rnz-UHQ'
  var mapId = 'dreiradfahrer.p4c1b8g6'
  var markersPath = '/markers.geojson'

  function initMap() {
    L.mapbox.accessToken = accessToken;

    var smallLegend = document.getElementById('small-legend').innerHTML;
    var legend = document.getElementById('legend').innerHTML;

    var map = L.mapbox.map( 'map', mapId, {
      legendControl: {
        position: 'topright',
      }
    }).setView([46.95, 7.45], 5);

    map.legendControl.addLegend(smallLegend);
    map.legendControl.position = 'topright';

    $(document).on('click', "#toggle-legend-on", function() {
      map.legendControl.removeLegend(smallLegend);
      map.legendControl.addLegend(legend);
    });

    $(document).on('click', '#toggle-legend-off', function() {
      map.legendControl.removeLegend(legend);
      map.legendControl.addLegend(smallLegend);
    });

    return map;
  }

  return {
    initialize: function() {
      initMap();
    }
  }

}();

$(document).on('ready', function() {
  WorldMap.initialize();
});
