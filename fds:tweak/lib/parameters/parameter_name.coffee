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

