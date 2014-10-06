class @Context
  constructor: (kwargs) ->
    @_parameterBuilderFactory = kwargs.parameterBuilderFactory
    @_storageClass = kwargs.storageClass

  createStorage: (args...) =>
    new @_storageClass args...

  createParameterBuilder: (args...) =>
    @_parameterBuilderFactory.create this, args...

