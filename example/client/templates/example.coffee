Template.example.created = ->
  pod =
    name: 'circle'
    type: 'group'
    value: [
      name: 'radius'
      type: 'number'
      value: 0
    ,
      name: 'color'
      type: 'group'
      value: [
        name: 'red'
        type: 'number'
        value: 0
      ,
        name: 'green'
        type: 'number'
        value: 0
      ,
        name: 'blue'
        type: 'number'
        value: 0
      ]
    ]

  tweak = Tweak.create storage: 'remote'
  @_circle = tweak.fromSchema pod


Template.example.rendered = ->
  canvas = @find 'canvas'
  ctx = canvas.getContext '2d'
  @_computation = Tracker.autorun =>
    w = canvas.width
    h = canvas.height
    w2 = w / 2
    h2 = h / 2
    m2 = Math.min w2, h2

    radius = @_circle.getParam('radius').getValue() / 100
    color =  @_circle.getParam 'color'
    r = color.getParam('red').getValue()
    g = color.getParam('green').getValue()
    b = color.getParam('blue').getValue()

    ctx.clearRect 0, 0, w, h
    ctx.beginPath()
    ctx.arc w2, h2, m2 * radius, 0, 2 * Math.PI, false
    ctx.fillStyle = "rgba(#{ r }, #{ g }, #{ b }, 1)"
    ctx.fill()


Template.example.helpers
  circle: ->
    Template.instance()._circle

  json: ->
    JSON.stringify Template.instance()._circle.toJSONValue(), null, '  '


Template.example.destroyed = ->
  @_computation.stop()

