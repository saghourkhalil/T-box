// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


var map, infoWindow;

function initMap(lat, lng) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 15
    };

    infoWindow = new google.maps.InfoWindow;

    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };

        infoWindow.setPosition(pos);
        infoWindow.setContent('Vous vous trouvez ici.');
        infoWindow.open(map);
        map.setCenter(pos);
      }, function() {
        handleLocationError(true, infoWindow, map.getCenter());
      });
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }

    var map    = new google.maps.Map(document.getElementById('map'), mapOptions);
    var marker = new google.maps.Marker({
        position: myCoords,
        map: map
    });

    var request = {
        origin: myCoords,
        destination: pos,
        travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
    });
};

function initMap2() {
    var lat = document.getElementById('place_latitude').value;
    var lng = document.getElementById('place_longitude').value;
    
    // if not defined create default position Lyon
    if (!lat || !lng){
        lat=45.7567905;
        lng=4.8514316;
        document.getElementById('place_latitude').value = lat;
        document.getElementById('place_longitude').value = lng;
    }
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 14
    };
    var map = new google.maps.Map(document.getElementById('map2'), mapOptions);
    var marker = new google.maps.Marker({
        position: myCoords,
        animation: google.maps.Animation.DROP,
        map: map,
        draggable: true
    });
    // refresh marker position and recenter map on marker
    function refreshMarker(){
        var lat = document.getElementById('place_latitude').value;
        var lng = document.getElementById('place_longitude').value;
        var myCoords = new google.maps.LatLng(lat, lng);
        marker.setPosition(myCoords);
        map.setCenter(marker.getPosition());   
    }
    // when input values change call refreshMarker
    document.getElementById('place_latitude').onchange = refreshMarker;
    document.getElementById('place_longitude').onchange = refreshMarker;
    // when marker is dragged update input values
    marker.addListener('drag', function() {
        latlng = marker.getPosition();
        newlat=(Math.round(latlng.lat()*1000000))/1000000;
        newlng=(Math.round(latlng.lng()*1000000))/1000000;
        document.getElementById('place_latitude').value = newlat;
        document.getElementById('place_longitude').value = newlng;
    });
    // When drag ends, center (pan) the map on the marker position
    marker.addListener('dragend', function() {
        map.panTo(marker.getPosition());   
    });
}