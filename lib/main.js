exports.main = function(options, callbacks) {
  var port = 8080;
  var basePath = require("file").dirname( // the directory...
                   require("url").toFilename(__url__)); // ...main.js is in
  var {startServerAsync} = require("httpd")

  var srv = startServerAsync(port, basePath);
  require("unload").when(function cleanup() {
    srv.stop(function() { /* Unfortunately we can't prevent further shutdown, so this is no-op. */ })
  });
  require("timer").setTimeout(function() {
    require("tabs").open("http://localhost:" + port + "/");
  }, 0);
}
