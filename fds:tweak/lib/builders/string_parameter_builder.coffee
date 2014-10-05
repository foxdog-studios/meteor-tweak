class @StringParameterBuilder extends AbstractParameterBuilder
  build: ->
    new StringParameter(
      @getContext().createStorage(@getName()),
      @getName(),
      @getPOD().value
    )

  @getParameterClass: ->
    StringParameter

