class @GroupParameter extends AbstractParameter
  constructor: (name) ->
    super name
    @_params = []
    @_byName = {}
    @_structure = new Tracker.Dependency

  add: (param) =>
    @_params.push param
    @_byName[param.getName()] = [param, new Tracker.Dependency]
    @_structure.changed()

  remove: (target) =>
    for [param, dep], i in @_params
      if param == target
        @_params.splice i, 1
        dep.changed()
        return

  getParam: (name) =>
    [param, dep] = @_byName[name]
    dep.depend()
    param

  getParams: =>
    @_structure.depend()
    @_params.slice()

  getClass: =>
    GroupParameter

  @getType: ->
    'group'


  # = EJSON interface ========================================================

  toJSONValue: =>
    pod = super()
    pod.value = for param in @getParams()
      param.toJSONValue()
    pod

  clone: =>
    new @getClass() @getName()

  equals: (other) =>
    Utils.throwNotImplemented 'equals'



