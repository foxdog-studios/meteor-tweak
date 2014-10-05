Tinytest.add 'Test', (test) ->
  tweak = Tweak.create storage: 'remote'
  params = tweak.fromSchema
    name: 'circle'
    type: 'string'
    value: 'Yes'
  console.log params
