class @ParameterBuilder
  constructor: (@_ctx, @_schema) ->

  build: ->
    @_ctx.createParameterBuilder(
      @_schema.type,
      new ParameterName,
      @_schema
    ).build()

