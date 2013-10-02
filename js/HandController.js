listenToHands = function (callback) {
  // Initialize a new web socket.
  var socket = new WebSocket("ws://localhost:8181/KinectHtml5");

  // Receive data FROM the server!
  socket.onmessage = function (evt) {
    status.innerHTML = "Kinect data received.";

    // Get the data in JSON format.
    var jsonObject = eval('(' + evt.data + ')');
    callback(jsonObject);
    socket.send("Skeleton updated on: " + (new Date()).toDateString() + ", " + (new Date()).toTimeString());
  };
};