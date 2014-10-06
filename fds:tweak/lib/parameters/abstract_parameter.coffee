class @AbstractParameter
  constructor: (@_name) ->

  getName: =>
    @_name.getName()

  getDisplayName: =>
    @_name.getDisplayName()

  getFullName: =>
    @_name.getFullName()

  getType: =>
    @constructor.getType()

  @getType: ->
    Utils.throwNotImplemented 'getType'


  # = EJSON interface ========================================================

  typeName: =>
    EJSON_PARAMETER

  toJSONValue: =>
    name: @getName()
    type: @getType()

  clone: =>
    Utils.throwNotImplemented 'clone'

  equals: (other) =>
    Utils.throwNotImplemented 'equals'

