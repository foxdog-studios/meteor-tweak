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
    if Meteor.isClient
      @_subcription = Meteor.subscribe 'fds:tweak:parameters'

  ready: =>
    Meteor.isServer or @_subcription.ready()

  fromSchema: (schema) =>
    new ParameterBuilder(@_ctx, schema).build()

  fromCollection: (fullName) =>
    groups = {}
    cursor = Parameters.find
      name: new RegExp "^#{ fullName }"
    for param in cursor.fetch()
      name = ParameterName.parse param.name
      for groupName in name.getGroupNames()
        if groups[groupName]?
          group = groups[groupName]
        else
          group =
            name: groupName
            type: 'group'
            value: []
          groups[groupName] = group
          if lastGroup?
            lastGroup.value.push group
          else
            schema = group
        schema = group unless schema?
        lastGroup = group
      paramSchema =
        name: name.getName()
        type: param.type
        value: param.value
      group.value.push paramSchema
    @fromSchema schema

