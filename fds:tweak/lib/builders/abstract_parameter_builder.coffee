class @AbstractParameterBuilder
  constructor: (@_ctx, parentName, @_pod) ->
    @_name = parentName.join @_pod.name

  getContext: =>
    @_ctx

  getName: =>
    @_name

  getPOD: =>
    @_pod

  build: =>
    Utils.throwNotImplemented 'build'

  @getParameterClass: ->
    Utils.throwNotImplemented 'getParameterClass'

  @getParameterType: ->
    @getParameterClass().getType()

