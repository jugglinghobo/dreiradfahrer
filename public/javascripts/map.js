var WorldMap = function() {

  var accessToken = 'pk.eyJ1IjoiZHJlaXJhZGZhaHJlciIsImEiOiJjaWtoYWE1c3AwMDF5dzhsczFiaTU1Zm5kIn0.9oZmsOhe2xy-qG6rnz-UHQ'
  var mapId = 'dreiradfahrer.p4c1b8g6'
  var markersPath = '/markers.geojson'

  function initMap() {
    L.mapbox.accessToken = accessToken;

    var map = L.mapbox.map( 'map', mapId).setView([46.95, 7.45], 10);

    var featureLayer = L.mapbox.featureLayer()
    .loadURL(markersPath)
    .addTo(map);

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
