Template.booleanParameter.helpers
  checked: ->
    @param.getValue()

  id: ->
    @param.getFullName()

  label: ->
    @param.getDisplayName()


Template.booleanParameter.events
  'change input': (event, template) ->
    template.data.param.setValue event.target.checked

