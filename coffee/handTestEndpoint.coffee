hands = {}
count = 0

$(document).ready( ->
  listenToHands(handDataCallback);
)

handDataCallback = (data) ->
  count++
  for skeleton in data.skeletons
    if skeleton.id != 0
      processSkeleton(skeleton)

processSkeleton = (skeleton) ->
  if !hands[skeleton.id]?
    hands[skeleton.id] = $("<div id='#{skeleton.id}' class='hand-div'/>").text(skeleton.id)
    $('body').append(hands[skeleton.id])
  for joint in skeleton.joints
    if joint.name == 'handright'
      $hand = hands[skeleton.id]
      newPoint =
        x: joint.x * 428.3 + joint.y * 1379.7 - joint.z * 464.7 + 1458.1
        y: joint.x * 105.2 + joint.y * 375.3 - joint.z * 1661.5 + 3951.7
      currentPoint = 
        x: $hand[0].offsetLeft
        y: $hand[0].offsetTop

      # console.log 'Kinect: ' + joint.x + ' ' + joint.y + ' ' + joint.z
      # console.log 'Point1: ' + newPoint.x + ' ' + newPoint.y
      # console.log 'Point2: ' + currentPoint.x + ' ' + currentPoint.y

      if newPoint.x > -100 and newPoint.x < $('body').width()
        if getDistBetween(currentPoint, newPoint) < 100 or (currentPoint.x == 0 and currentPoint.y == 0) or count > 30
          count = 0
          $hand.css
            left: newPoint.x
            top: newPoint.y

getDistBetween = (point1, point2) ->
  x = Math.pow(point1.x - point2.x, 2)
  y = Math.pow(point1.y - point2.y, 2)
  return Math.sqrt(x + y)