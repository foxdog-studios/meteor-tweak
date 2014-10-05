class @AbstractParameter
  constructor: (@_name) ->

  getName: =>
    @_name.getName()

  getDisplayName: =>
    @_name.getDisplayName()

  getFullName: =>
    @_name.getFullName()

  getClass: =>
    Utils.throwNotImplemented '@getClass'

  getType: =>
    @getClass().getType()

  @getType: ->
    Utils.throwNotImplemented 'getType'


  # = EJSON interface ========================================================

  typeName: =>
    EJSON_TYPE_NAME

  toJSONValue: =>
    name: @getName()
    type: @getType()

  clone: =>
    Utils.throwNotImplemented 'clone'

  equals: (other) =>
    Utils.throwNotImplemented 'equals'

