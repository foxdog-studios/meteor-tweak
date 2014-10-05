Parameters = new Meteor.Collection 'fds:tweak:parameters'


class @RemoteStorage
  constructor: (@_name, value) ->
    @set value

  set: (value) =>
    Meteor.call 'fds:tweak:setValue', @_name.getFullName(), value

  get: =>
    param = Parameters.findOne
      name: @_name.getFullName()
    ,
      fields:
        value: 1
    param?.value


Meteor.methods
  'fds:tweak:setValue': (name, value) ->
    check name, String
    check value, Match.Any
    Parameters.upsert
      name: name
    ,
      $set:
        value: value

