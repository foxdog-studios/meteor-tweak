class @RangeParameter extends AbstractParameter
  constructor: (name, kwargs) ->
    super name

    {
      min: @_min
      value: @_value
      max: @_max
      step: @_step
    } = kwargs

  getMin: =>
    @_min.getValue()

  getValue: =>
    @_value.getValue()

  setValue: (value) =>
    @_value.setValue value

  getMax: =>
    @_max.getValue()

  getStep: =>
    @_step.getValue()

  @getType: ->
    'range'

  toJSONValue: =>
    schema = super()
    schema.value =
      min: @getMin()
      value: @getValue()
      max: @getMax()
      step: @getStep()
    schema

