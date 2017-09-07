
function initMap() {
        var Toronto = {lat: 43.6532, lng: -79.3832};
        var map = new google.maps.Map(document.getElementById('event-map'), {
          zoom: 10,
          center: Toronto
        });
        var contentString = '<div id="content">'+
          '<div id="siteNotice">'+
          '</div>'+
            '<h1 id="firstHeading" class="firstHeading">${event.name}</h1>'+
          '<div id="bodyContent">'+
            '{description: event.description}' +
          '</div>'+
        '</div>';

        fetch('/events.json')
          .then( function(resp) { return resp.json(); })
          .then( function(json) {
            json.forEach( function(event) {
               var infowindow = new google.maps.InfoWindow({
                content: contentString
              });
              var marker = new google.maps.Marker({
                position: {lat: event.lat, lng: event.lng},
                map: map
              })
              marker.addListener('click', function() {
              infowindow.open(map, marker);
              });
            })
          });
        }