class @ContextBuilder
  constructor: ->
    @useLocalStorage()

  build: =>
    new Context
      parameterBuilderFactory: @_buildParameterBuilderFactory()
      storageClass: @_storageClass

  _buildParameterBuilderFactory: ->
    new ParameterBuilderFactory [
      BooleanParameterBuilder
      GroupParameterBuilder
      NumberParameterBuilder
      RangeParameterBuilder
      StringParameterBuilder
    ]

  useLocalStorage: =>
    @_storageClass = LocalStorage

  useRemoteStorage: =>
    @_storageClass = RemoteStorage
