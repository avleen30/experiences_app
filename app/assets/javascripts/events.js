


function initMap_detail() {
        var toronto = {lat: 43.6532, lng: -79.3832};
        var map = new google.maps.Map(document.getElementById('event-map'), {
          zoom: 12,
          center: toronto
        });

        fetch('/events/'+window.event.id+'.json')
          .then( function(resp) { return resp.json(); })
          .then( function(json) {
            var marker = new google.maps.Marker({
              position: {lat: json.lat, lng: json.lng},
              map: map
            })
          });
        }

