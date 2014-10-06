class @AbstractValueParameterBuilder extends AbstractParameterBuilder
  build: ->
    new (@getParameterClass())(
      @getContext().createStorage(
        @getName(),
        @getSchema().type,
        @getSchema().value
      ),
      @getName(),
      @getSchema().value
    )

