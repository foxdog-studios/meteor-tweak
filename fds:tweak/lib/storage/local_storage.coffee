class @LocalStorage
  constuctor: (@_name, value) ->
    @_value = ReactiveVar value

  get: =>
    @_value.get()

  set: (value) =>
    @_value.set value

