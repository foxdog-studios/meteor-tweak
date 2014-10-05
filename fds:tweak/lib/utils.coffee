@Utils =
  objectFrom: (array, iteratee) ->
    object = Object.create null
    for arrayValue in array
      [objectKey, objectValue] = iteratee arrayValue
      object[objectKey] = objectValue
    object

  throwNotImplemented: (methodName) ->
    throw new Error "Subclass must implement #{ methodName }() but does not."

