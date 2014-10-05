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


### Tweak


#### Tweak.create([options]) Anywhere

Create an new instance of Tweak, configured by `options`


##### Parameters

*   `options` (Object, optional): With properties;
    *    `storage` (String, optional): Specifies where to store parameter values. Either `'local'` or `'remote'`. If `'local'`, values are stored locally and changes __aren't__ be seen by other users. If `'remote'`, values are stored in a collection and changes __are__ be seen by other users.
     
         Default:`'local'`


##### Returns

An instance of `TweakAPI`


### TweakAPI
