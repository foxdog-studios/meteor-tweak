class @AbstractParameterBuilder
  constructor: (@_ctx, parentName, @_pod) ->
    @_name = parentName.join @_pod.name

  getContext: =>
    @_ctx

  getName: =>
    @_name

  getPOD: =>
    @_pod

  @getParameterClass: ->
    Utils.throwNotImplemented 'getParameterClass'

  @getParameterType: ->
    @getParameterClass().getType()

