Template.parameterPanel.helpers
  show: ->
    Session.get 'fds:tweak:show'

Template.parameterPanel.events
  'click .tweak-hide': (event, template) ->
    Session.set 'fds:tweak:show', false

