class @ParameterName
  SEP = ':'

  constructor: (@_parts...) ->

  getName: =>
    @_parts[@_parts.length - 1]

  getDisplayName: =>
    @getName().charAt(0).toUpperCase() + @getName().slice 1

  getFullName: =>
    @_parts.join SEP

  join: (newParts...) =>
    new ParameterName @_parts..., newParts...


  # = EJSON Interface ========================================================

  typeName: =>
    'fds:tweak:name'

  toJSONValue: =>
    @_parts

  clone: =>
    @join()

  equals: (other) =>
    if @_parts.length != other.length
      return false
    for part, i in @_parts
      if other._parts[i] != part
        return false
    true

