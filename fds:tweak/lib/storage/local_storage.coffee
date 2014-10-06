class @LocalStorage
  constructor: (@_name, type, value) ->
    @_value = ReactiveVar value

  get: =>
    @_value.get()

  set: (value) =>
    @_value.set value

