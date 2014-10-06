class @RangeParameterBuilder extends AbstractParameterBuilder
  constructor: (ctx, parentName, schema) ->
    super ctx, parentName, schema

    @_builders = for subName, subValue of @getSchema().value
      subSchema =
        name: subName
        type: NumberParameter.getType()
        value: subValue

      builder = @getContext().createParameterBuilder(
        subSchema.type,
        @getName(),
        subSchema
      )

      [subName, builder]

  build: =>
    kwargs = {}
    for [paramName, builder] in @_builders
      kwargs[paramName] = builder.build()
    new (@getParameterClass()) @getName(), kwargs

  @getParameterClass: ->
    RangeParameter

