Template.stringParameter.helpers
  id: ->
    @param.getName()

  label: ->
    @param.getDisplayName()

  value: ->
    @param.getValue()


Template.stringParameter.events
  'changed input, input input': (event, template) ->
    template.data.param.setValue event.target.value

