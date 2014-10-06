Template.numberParameter.helpers
  id: ->
    @param.getName()

  label: ->
    @param.getDisplayName()

  value: ->
    @param.getValue()


Template.numberParameter.events
  'changed input, input input': (event, template) ->
    template.data.param.setValue parseFloat event.target.value

