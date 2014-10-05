class @NumberParameterBuilder extends AbstractParameterBuilder
  build: ->
    new NumberParameter(
      @getContext().createStorage(@getName()),
      @getName(),
      @getPOD().value
    )

  @getParameterClass: ->
    NumberParameter

