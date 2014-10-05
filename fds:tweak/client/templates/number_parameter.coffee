Template.numberParameter.helpers
  id: ->
    @param.getName()

  label: ->
    @param.getDisplayName()

  value: ->
    @param.getValue()


Template.numberParameter.events
  'changed input, input input': (event, template) ->
    value = event.target.value
    value = parseInt value
    template.data.param.setValue parseFloat value

