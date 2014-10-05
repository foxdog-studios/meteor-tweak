class @AbstractValueParameter extends AbstractParameter
  constructor: (@_storage, name, value) ->
    super name
    @setValue value

  getValue: =>
    @_storage.get()

  setValue: (value) =>
    @_storage.set value


  # = EJSON interface ========================================================

  toJSONValue: =>
    pod = super()
    pod.value = @getValue()
    pod

  clone: =>
    new @getClass() @getValue()

  equals: (other) =>
    @getValue.get() == other.getValue()

