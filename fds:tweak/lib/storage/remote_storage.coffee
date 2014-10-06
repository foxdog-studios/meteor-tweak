COLLECTION_NAME = 'fds:tweak:parameters'

Parameters = new Meteor.Collection COLLECTION_NAME

if Meteor.isClient
  Meteor.subscribe COLLECTION_NAME

if Meteor.isServer
  Meteor.publish COLLECTION_NAME, ->
    Parameters.find()


class @RemoteStorage
  constructor: (@_name, @_type, value) ->
    @set value

  set: (value) =>
    callback = (error, result) ->
      console.log error if error?
      console.log result if result?
    Meteor.call 'fds:tweak:setValue', @_name, @_type, value, callback

  get: =>
    param = Parameters.findOne
      name: @_name.getFullName()
    ,
      fields:
        value: 1
    param?.value


Meteor.methods
  'fds:tweak:setValue': (name, type, value) ->
    check name, ParameterName
    check type, String
    check value, Match.Any
    Parameters.upsert
      name: name.getFullName()
    ,
      $set:
        type: type
        value: value
    return

