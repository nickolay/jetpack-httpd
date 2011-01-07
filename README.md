Provides a HTTP server written in JavaScript for the Mozilla platform, which can be used in unit tests.

The most basic usage is:

    var {startServerAsync} = require("httpd")
    var srv = startServerAsync(port, basePath);
    require("unload").when(function cleanup() {
      srv.stop(function() { // ideally you should continue execution from this point.
      })
    });

You can also use `nsHttpServer` to start the server manually:

    var {nsHttpServer} = require("httpd");
    var srv = new nsHttpServer();
    // further documentation on developer.mozilla.org

Example `main.js` and a simple unit test (`test-httpd.js`) are provided with this package. Try `cfx run` and `cfx test`.

See <https://developer.mozilla.org/en/httpd.js/HTTP_server_for_unit_tests> for general information.
