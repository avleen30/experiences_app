
function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('event-map'), {
          zoom: 4,
          center: uluru
        });

        fetch('/events.json')
          .then( function(resp) { return resp.json(); })
          .then( function(json) {
            json.forEach( function(event) {
              var marker = new google.maps.Marker({
                position: {lat: event.lat, lng: event.lng},
                map: map
              })
            })
          });
        }