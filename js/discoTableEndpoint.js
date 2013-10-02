(function() {
  $(document).ready(function() {
    var discoTable, leapController, leapModel, session;
    leapModel = new disco.leap.LeapModel();
    leapController = new disco.leap.LeapController({
      leapModel: leapModel,
      sanitizeData: true,
      drawFingers: true
    });
    session = new disco.Session;
    discoTable = new disco.DiscoTable({
      el: $('body'),
      session: session
    });
    return discoTable.render();
  });

}).call(this);
