@Tweak = Tweak = Object.create null

Tweak.create = (options = {}) ->
  builder = new ContextBuilder()

  # Storage
  if options.storage?
    switch options.storage
      when 'local'  then builder.useLocalStorage()
      when 'remote' then builder.useRemoteStorage()
      else throw new Error "Unknown storage type: #{ options.storage }"

  new TweakAPI builder.build()


class TweakAPI
  constructor: (@_ctx) ->

  fromSchema: (schema) =>
    new ParameterBuilder(@_ctx, schema).build()

