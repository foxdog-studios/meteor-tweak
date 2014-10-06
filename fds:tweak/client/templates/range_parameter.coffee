Template.rangeParameter.helpers
  id: ->
    @param.getFullName()

  label: ->
    @param.getDisplayName()

  max: ->
    @param.getMax()

  min: ->
    @param.getMin()

  step: ->
    @param.getStep()

  value: ->
    @param.getValue()


Template.rangeParameter.events
  'change input, input input': (event, template) ->
    template.data.param.setValue parseFloat event.target.value

