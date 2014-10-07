STATES      = 0
STATE_VALUE = STATES++
STATE_MIN   = STATES++
STATE_MAX   = STATES++
STATE_STEP  = STATES++


Template.rangeParameter.created = ->
  @_state = ReactiveVar STATE_VALUE


Template.rangeParameter.helpers
  id: ->
    @param.getName()

  label: ->
    state = Template.instance()._state.get()
    if state != STATE_VALUE
      switch state
        when STATE_MIN then 'Min'
        when STATE_MAX then 'Max'
        when STATE_STEP then 'Step'
    else
      @param.getDisplayName()

  labelClass: ->
    if Template.instance()._state.get() != STATE_VALUE
      'tweak-parameter-limit'

  template: ->
    switch Template.instance()._state.get()
      when STATE_VALUE then 'rangeParameterValue'
      else 'rangeParameterLimit'

  data: ->
    switch Template.instance()._state.get()
      when STATE_VALUE then @param
      when STATE_MIN then get: @param.getMin, set: @param.setMin
      when STATE_MAX then get: @param.getMax, set: @param.setMax
      when STATE_STEP then get: @param.getStep, set: @param.setStep


Template.rangeParameter.events
  'click label': (event, template) ->
    state = template._state
    state.set (state.get() + 1) % STATES


Template.rangeParameterValue.helpers
  id: ->
    @getFullName()


  max: ->
    @getMax()

  min: ->
    @getMin()

  step: ->
    @getStep()

  value: ->
    @getValue()


Template.rangeParameterValue.events
  'input input': (event, template) ->
    template.data.setValue parseFloat event.target.value


Template.rangeParameterLimit.helpers
  value: ->
    @get()


Template.rangeParameterLimit.events
  'input input': (event, template) ->
    template.data.set parseFloat event.target.value

