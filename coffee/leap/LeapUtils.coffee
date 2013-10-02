do ->
  disco.leap.LeapUtils = {}
  utils = disco.leap.LeapUtils

  utils.normalizeToScreen = (box, point) ->
    norm = box.normalizePoint(point)
    norm[0] = norm[0] * screen.width
    norm[2] = norm[2] * screen.height
    return norm