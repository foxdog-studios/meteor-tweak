class @GroupParameterBuilder extends AbstractParameterBuilder
  constructor: (ctx, parentName, pod) ->
    super ctx, parentName, pod
    @_builders = for paramPOD in @getPOD().value
      @getContext().createParameterBuilder paramPOD.type, @getName(), paramPOD

  build: =>
    group = new GroupParameter @getName()
    for builder in @_builders
      group.add builder.build()
    group

  @getParameterClass: ->
    GroupParameter

