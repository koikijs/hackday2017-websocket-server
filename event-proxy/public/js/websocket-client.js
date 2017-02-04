(function() {
  $(function() {
    var con = new WebSocket('ws://192.168.1.117:8888');
    con.onopen = function() {
    };

    con.onerror = function() {
      console.log("connection failed")
    };

    con.onmessage = function (e) {
      console.log(e.data);
      $("#event-list").append("<li>"+e.data+"</li>");
    };
  });
})();
