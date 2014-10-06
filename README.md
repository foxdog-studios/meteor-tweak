# Tweak

__Parameter tweaking made fun.__

Tweak takes a JSON schema describing your parameters (e.g., number of enemies)
and gives you;

*   an automatically generated UI for tweaking value;
*   multi-user realtime updates; and
*   reactivity.


## Install

Tweak is a Meteor packages and can be install by running;

```ShellSession
$ meteor add fds:tweak
```

in a Meteor project.


## Quick start

1.  Create a new Meteor project, install Tweak, create a `client` directory,
    and start a development server by running;

    ```ShellSession
    $ meteor create example
    $ cd example
    $ meteor add fds:tweak
    $ mkdir client
    $ meteor
    ```

3.  Create a file `param.js` that contains;

    ```JavaScript
    // Create an instance of Tweak that stores parameter values in a
    // collection so that all users can see and update the same values.
    var tweak = Tweak.create({storage: 'remote'});

    // Create a string parameter named message with the value 'Hello,
    // World!'.
    message = tweak.fromSchema({
      name: 'message',
      type: 'string',
      value: 'Hello, World!'
    });
    ```

2.  Create a file named `body.html` in the `client` directory that contains;

    ```Handlebars
    <body>
      {{!-- Automatically generate a UI for tweaking the message --}}
      {{> parameter message}}

      {{!-- Show the current message --}}
      <p>{{messageValue}}</p>
    </body>
    ```

5.   Create a file named `body.js in the `client` directory that contains;

    ```JavaScript
    Template.body.helpers({
      message: message,
      messageValue: function () {
        return message.value();
      }
    });
    ```

6.  Navigate to `http://127.0.0.1/` on multiple machines and change the message
    in the text input.

7.  Read the rest of the documentation.


## Documentation

### _Schema_

A schema is a _plain old data_ (POD) object that describes a tree of parameters.
Each parameter in the tree has (at least) three attributes:

*   `name` (String, required): The name of the parameter. For example, the name
    a parameter storing the radius of a circle could be `'radius'`. Names must
    be alphenumeric.

*   `type` (String, required): The type of the parameter (See Parameter types).
    For example, the `type` of a parameter storing the radius of a circle could
    be `'number'`.

*   `value` (_Type dependent_, required): The initial or defualt value of the
    parameter.  Exactly what a parameter's value can be depends on the
    parameter's type. For example, the `value` of a parameter storing the
    radius of a circle could be `2.5`.

A parameter's _full name_ is it's name prefixed by the full name of the group
it's in. For example, `cirle:radius`. A parameter's full name must be unique.


#### _Parameter types_


##### boolean

```JSON
{
  "name": "fill",
  "type": "boolean",
  "value": true
}
```


##### number

```JSON
{
  "name": "radius",
  "type": "number",
  "value": 1
}
```


##### string

```JSON
{
  "name": "surname",
  "type": "string",
  "value": "Jamie"
}
```

##### range

```JSON
{
  "name": "red"
  "type": "range",
  "value": {
    "min": 0,
    "value": 128,
    "max": 255,
    "step": 1
  }
}
```


##### group

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



#### _instance_.getValue() Reactive, Anywhere

Get the parameter's current value.


##### Parameters

_None_


##### Returns

The parameter's current value. The type of the value depends on the parameter's
type.


#### _instance_.setValue(value) Anywhere

Set the parameter's value to `value`.


##### Parameters

*   `value` (_Type dependent_, required): The value to assign to the parameter.
            The set of acceptbale values is dependent on the parameter's type
            (see Parameter types).

##### Returns

_Nothing_


### GroupParameter


#### _instance_.getParameter(name) Reactive, Anywhere

Get a parameter in the group.


##### Parameters

*   `name` (String, required): The name of the parameter to get.


##### Returns

The parameter with the given `name`.


#### _instance_.getParameters() Reactive, Anywhere


##### Parameters


#### _instance_.appendSchema(schema) Anywhere

Create a new parameter from `schema` and append it to the group.


##### Parameters

*   `schema` (_Schema_, required): A schema of the parameter to append.


##### Returns

The parameter append to the group.


##### Example

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


#### _instance_.removeParameter(parameter) Anywhere

