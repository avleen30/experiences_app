
function generate_gif(param, cb) {
    $.get("http://api.giphy.com/v1/gifs/search?q="+ param + "&api_key=6f0aa220eb134e62901a4141d62bf573&limit=1")
      .then(function (data) {
        //   debugger
        //   cb(data) 
              document.getElementById('giphy') 
              return '<div id="content">' +
                  '<a href="/events/' + data + '" >' +
                  '<div id="siteNotice">' +
                  '</div>'
              
          })

        }
