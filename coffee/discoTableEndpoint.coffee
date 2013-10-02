$(document).ready( ->
  # Initialize Leap stuff
  leapModel = new disco.leap.LeapModel()
  leapController = new disco.leap.LeapController
    leapModel: leapModel
    sanitizeData: true
    drawFingers: true

  # Create main disco display (menu and content)
  session = new disco.Session

  discoTable = new disco.DiscoTable
    el: $('body')
    session: session

  discoTable.render()
)