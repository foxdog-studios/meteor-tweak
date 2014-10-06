class @BooleanParameterBuilder extends AbstractParameterBuilder
  build: =>
    new BooleanParameter(
      @getContext().createStorage(),
      @getName(),
      @getPOD().value
    )

  @getParameterClass: ->
    BooleanParameter

