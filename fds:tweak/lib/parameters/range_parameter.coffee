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

  setMin: (min) =>
    @_min.setValue min

  getValue: =>
    @_value.getValue()

  setValue: (value) =>
    @_value.setValue value

  getMax: =>
    @_max.getValue()

  setMax: (max) =>
    @_max.setValue max

  getStep: =>
    @_step.getValue()

  setStep: (step) =>
    @_step.setValue step

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

