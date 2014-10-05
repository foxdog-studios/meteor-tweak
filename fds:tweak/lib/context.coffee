class @Context
  constructor: (kwargs) ->
    @_parameterBuilderFactory = kwargs.parameterBuilderFactory
    @_storageClass = kwargs.storageClass

  createStorage: (args...) =>
    new @_storageClass args...

  createParameterBuilder: (type, args...) =>
    @_parameterBuilderFactory.create this, type, args...

