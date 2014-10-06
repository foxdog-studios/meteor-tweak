Template.example.rendered = ->
  canvas = @find 'canvas'
  ctx = canvas.getContext '2d'
  circle = @data.param

  @_computation = Tracker.autorun =>
    w = canvas.width
    h = canvas.height
    w2 = w / 2
    h2 = h / 2
    m2 = Math.min w2, h2


    radius = circle.getParam('radius').getValue() / 100
    color = circle.getParam 'color'
    r = color.getParam('red').getValue()
    g = color.getParam('green').getValue()
    b = color.getParam('blue').getValue()

    ctx.clearRect 0, 0, w, h
    ctx.beginPath()
    ctx.arc w2, h2, m2 * radius, 0, 2 * Math.PI, false
    ctx.fillStyle = ctx.strokeStyle = "rgba(#{ r }, #{ g }, #{ b }, 1)"

    if circle.getParam('fill').getValue()
      ctx.fill()
    else
      ctx.stroke()


Template.example.helpers
  json: ->
    JSON.stringify @param.toJSONValue(), null, '  '

  show: ->
    Session.equals 'fds:tweak:show', true


Template.example.events
  'click .tweak-show': (event, template) ->
    Session.set 'fds:tweak:show', true


Template.example.destroyed = ->
  @_computation.stop()

