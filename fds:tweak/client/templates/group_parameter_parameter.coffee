PARAMETER_TEMPLATES_BY_NAME = Utils.objectFrom(
  [
    [GroupParameter , 'groupParameter' ]
    [NumberParameter, 'numberParameter']
    [StringParameter, 'stringParameter']
  ]
,
  ([paramKlass, templateName]) ->
    [paramKlass.getType(), templateName]
)


Template.groupParameterParameter.helpers
  data: ->
    param: this

  template: ->
    PARAMETER_TEMPLATES_BY_NAME[@getType()]

