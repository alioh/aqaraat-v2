function gmap_show(company) {
  if ((company.lat == null) || (company.lng == null) ) {    // validation check if coordinates are there
    return 0;
  }
  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers([    // put marker method
      {
        "lat": company.lat,    // coordinates from parameter company
        "lng": company.lng,
        "picture": {    // setup marker icon
          "url": "https://upload.wikimedia.org/wikipedia/commons/0/02/Dot0.png",
          "width":  32,
          "height": 32
        }
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    handler.getMap().setZoom(18);    // set the default zoom of the map
  });
}

function gmap_form(company) {
  handler = Gmaps.build('Google');    // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    if (company && company.lat && company.lng) {    // statement check - new or edit view
      markers = handler.addMarkers([    // print existent marker
        {
          "lat": company.lat,
          "lng": company.lng,
          "picture": {
            "url": 'https://upload.wikimedia.org/wikipedia/commons/0/02/Dot0.png',
            "width":  32,
            "height": 32
          }
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(10);
    }
    else {    // show the empty map
      handler.fitMapToBounds();
      handler.map.centerOn([24.76, 46.89]);   // default location
      handler.getMap().setZoom(10);
    }
  });

  var markerOnMap;

  function placeMarker(location) {    // simply method for put new marker on map
    if (markerOnMap) {
      markerOnMap.setPosition(location);
    }
    else {
      markerOnMap = new google.maps.Marker({
        position: location,
        map: handler.getMap()
      });
    }
  }

  google.maps.event.addListener(handler.getMap(), 'click', function(event) {    // event for click-put marker on map and pass coordinates to hidden fields in form
    placeMarker(event.latLng);
    document.getElementById("map_lat").value = event.latLng.lat();
    document.getElementById("map_lng").value = event.latLng.lng();
  });
}