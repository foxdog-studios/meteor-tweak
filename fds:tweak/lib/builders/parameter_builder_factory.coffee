class @ParameterBuilderFactory
  constructor: (builderClasses) ->
    @_byName = {}
    for builderClass in builderClasses
      @_byName[builderClass.getParameterType()] = builderClass

  create: (ctx, type, builderArgs...) ->
    new @_byName[type] ctx, builderArgs...

