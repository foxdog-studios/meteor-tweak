PARAMETER_TEMPLATES = {}

addTemplate = (paramKlass, templateName) ->
  PARAMETER_TEMPLATES[paramKlass.getType()] = templateName

addTemplate GroupParameter, 'groupParameter'
addTemplate NumberParameter, 'numberParameter'
addTemplate StringParameter, 'stringParameter'


Template.parameter.helpers
  data: ->
    param: this

  template: ->
    PARAMETER_TEMPLATES[@getType()]

