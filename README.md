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
  {{> stringParameter param=param}}
  <p>{{value}}</p>
</body>
```

__example.coffee__
```JavaScript
var param = Tweak.create({storage: 'remote'}).fromSchema({
  name: 'text',
  type: 'string',
  value: 'Hello, World!'
});

Template.body.helpers({
  param: function () {
    return param;
  },
  value: function () {
    return param.getValue();
  }
});

Template.body.events({
  'changed input, input input': function (event) {
    return param.setValue(event.target.value);
  }
});
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


##### _string_

```JSON
{
    "name": "surname",
    "type": "text",
    "value": "Jamie"
}
```

##### _number_

```JSON
{
   "name": "radius",
   "type": "number",
   "value": 1
}
```


##### _group_

```JSON
{
  "name": "rectangle",
  "type": "group",
  "value": [
    {
      "name": "width",
      "type": "number",
      "value": 1
    },
    {
      "name": "height",
      "type": "number",
      "value": 1
    }
  ]
}
```

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


#### _instance_.fromSchema(_schema_) Anywhere


##### Parameters

*   `schema` (_Schema_, required):


##### Returns

A parameter tree as described by the schema.


### Parameter


#### _instance_.getValue() Reactive, Anywhere

#### _instance_.setValue(value) Anywhere

Set the parameter's value to `value`.


##### Parameters

*   `value` (_Type dependent_, required): The value to assign to the parameter.
            The set of acceptbale values is dependent on the parameter's type
            (see Parameter types).

##### Returns

__Nothing__


### GroupParameter

_Inherits from `Parameter`_


#### _instance_.getParameter(name) Reactive, Anywhere

Get a par

##### Parameters

#### _instance_.getParameters() Reactive, Anywhere

##### Parameters

#### _instance_.append(paramater) Anywhere

```JavaScript
tweak = Tweak.create();

group = tweak.fromSchema({
  name: 'circle',
  type: 'group',
  value: []
});

radius = group.fromSchema({
    name: 'radius',
    type: 'number',
    value: 1
});

value = group.getParameter('radius').getValue();

console.log(value);  // => 1
```

#### _instance_.remove(parameter) Anywhere

