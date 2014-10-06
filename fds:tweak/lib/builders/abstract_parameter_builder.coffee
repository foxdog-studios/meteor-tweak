class @AbstractParameterBuilder
  constructor: (@_ctx, parentName, @_schema) ->
    @_name = parentName.join @_schema.name

  getContext: =>
    @_ctx

  getName: =>
    @_name

  getSchema: =>
    @_schema

  build: =>
    Utils.throwNotImplemented 'build'

  getParameterClass: =>
    @constructor.getParameterClass()

  @getParameterClass: ->
    Utils.throwNotImplemented 'getParameterClass'

  @getParameterType: ->
    @getParameterClass().getType()

