@EJSON_TYPE_NAME = 'fds:tweak:parameter'

EJSON.addType EJSON_TYPE_NAME, (pod) ->
  builder = ParameterBuilders.create pod.type, new ParameterName, pod
  builder.build()

