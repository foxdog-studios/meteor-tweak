PARAMETER_TEMPLATES = {}

addTemplate = (paramKlass, templateName) ->
  PARAMETER_TEMPLATES[paramKlass.getType()] = templateName

addTemplate BooleanParameter, 'booleanParameter'
addTemplate GroupParameter  , 'groupParameter'
addTemplate NumberParameter , 'numberParameter'
addTemplate RangeParameter  , 'rangeParameter'
addTemplate StringParameter , 'stringParameter'


Template.parameter.helpers
  data: ->
    param: this

  template: ->
    PARAMETER_TEMPLATES[@getType()]

