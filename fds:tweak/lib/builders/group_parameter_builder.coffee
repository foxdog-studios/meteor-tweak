class @GroupParameterBuilder extends AbstractParameterBuilder
  constructor: (ctx, parentName, schema) ->
    super ctx, parentName, schema
    @_builders = for paramSchema in @getSchema().value
      @getContext().createParameterBuilder(
        paramSchema.type,
        @getName(),
        paramSchema
      )

  build: =>
    group = new (@getParameterClass()) @getName()
    for builder in @_builders
      group.add builder.build()
    group

  @getParameterClass: ->
    GroupParameter

