@EJSON_NAME = 'fds:tweak:name'
@EJSON_PARAMETER = 'fds:tweak:parameter'

EJSON.addType EJSON_NAME, (parts) ->
  new ParameterName parts...

EJSON.addType EJSON_PARAMETER, (pod) ->
  builder = ParameterBuilders.create pod.type, new ParameterName, pod
  builder.build()

