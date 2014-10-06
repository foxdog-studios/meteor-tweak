tweak = Tweak.create storage: 'remote'

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
        param: tweak.fromCollection 'circle'
      else
        null

