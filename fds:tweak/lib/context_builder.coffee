class @ContextBuilder
  constructor: ->
    @useLocalStorage()

  build: =>
    new Context
      parameterBuilderFactory: @_buildParameterBuilderFactory()
      storageClass: @_storageClass

  _buildParameterBuilderFactory: ->
    new ParameterBuilderFactory [
      GroupParameterBuilder
      NumberParameterBuilder
      StringParameterBuilder
    ]

  useLocalStorage: =>
    @_storageClass = LocalStorage

  useRemoteStorage: =>
    @_storageClass = RemoteStorage
