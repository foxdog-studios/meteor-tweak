tweak = Tweak.create storage: 'remote'

color =

param = tweak.fromSchema
  name: 'circle'
  type: 'group'
  value: [
    name: 'radius'
    type: 'range'
    value:
      min: 0
      value: 10
      max: 100
      step: 0.5
  ,
    name: 'fill',
    type: 'boolean',
    value: true
  ,
    name: 'color'
    type: 'group'
    value: [
      name: 'red'
      type: 'range'
      value:
        min: 0
        value: 128
        max: 255
        step: 1
    ,
      name: 'green'
      type: 'range'
      value:
        min: 0
        value: 128
        max: 255
        step: 1
    ,
      name: 'blue'
      type: 'range'
      value:
        min: 0
        value: 128
        max: 255
        step: 1
    ]
  ]

Router.configure
  loadingTemplate: 'loading'

Router.onBeforeAction 'loading'

Router.map ->
  @route 'example',
    path: '/'

    waitOn: ->
      tweak

    data: ->
      if tweak.ready()
        param: param
      else
        null

