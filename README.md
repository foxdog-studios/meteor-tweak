# Tweak

Parameter tweaking made fun.


## Install

```ShellSession
$ meteor add fds:tweak
```



## Quick start

__example.html__
```Handlebars
<body>
  <input>
  <p>{{text}}</p>
</body>
```

__example.coffee__
```CoffeeScript
param = Tweak.create(storage: 'remote').fromSchema
  name: 'text'
  type: 'string'
  value: 'Hello, World!'

Template.body.helpers
  text: ->
    param.getValue()

Template.body.events
  'changed input, input input': (event) ->
    param.setValue(event.target.value)
```


## Documentation

### _Schema_

A schema is a _plain old data_ (POD) object that describes a tree of parameters.
Each node in the tree have three attributes:

*   `name` (String, required): The name of the parameter. For example, the name
           a parameter storing the radius of a circle could be `'radius'`.

*   `type` (String, required): The type of the parameter (See Parameter types).
           For example, the `type` of a parameter storing the radius of a circle
           could be `'number'`.

*   `value` (Any, required): The initial or defualt value of the parameter.
            Exactly what a parameter's value can be depends on the parameter's
            type. For example, the `value` of a parameter storing the radius of
            a circle could be `2.5`.


#### _Parameter types_

##### `group`

##### `string`

##### `number'

### Tweak


#### Tweak.create([options]) Anywhere

Create an new instance of Tweak, configured by `options`


##### Parameters

*   `options` (Object, optional): With properties;
    *    `storage` (String, optional): Specifies where to store parameter
         values. Either `'local'` or `'remote'`. If `'local'`, values are
         stored locally and changes __aren't__ be seen by other users. If
         `'remote'`, values are stored in a collection and changes __are__ be
         seen by other users.

         Default:`'local'`


##### Returns

An instance of `TweakAPI`


### TweakAPI

#### _instance_.fromSchema(schema)
