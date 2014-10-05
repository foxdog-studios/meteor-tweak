Package.describe({
  name: 'fds:tweak',
  summary: 'Reactive parameter tweaking',
  version: '0.0.0',
  git: " \* Fill me in! *\ "
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@0.9.3.1');
  api.use([
    'coffeescript',
    'ejson',
    'reactive-var',
    'templating',
  ]);

  api.addFiles([
    'lib/ejson.coffee',
    'lib/namespace.coffee',
    'lib/utils.coffee',

    'lib/context.coffee',
    'lib/context_builder.coffee',

    'lib/storage/local_storage.coffee',
    'lib/storage/remote_storage.coffee',

    'lib/parameters/parameter_name.coffee',
    'lib/parameters/abstract_parameter.coffee',
    'lib/parameters/abstract_value_parameter.coffee',
    'lib/parameters/number_parameter.coffee',
    'lib/parameters/string_parameter.coffee',
    'lib/parameters/group_parameter.coffee',

    'lib/builders/parameter_builder_factory.coffee',
    'lib/builders/parameter_builder.coffee',
    'lib/builders/abstract_parameter_builder.coffee',
    'lib/builders/number_parameter_builder.coffee',
    'lib/builders/string_parameter_builder.coffee',
    'lib/builders/group_parameter_builder.coffee',
  ]);

  api.addFiles(
    [
      'client/templates/group_parameter.html',
      'client/templates/group_parameter.coffee',
      'client/templates/group_parameter_parameter.html',
      'client/templates/group_parameter_parameter.coffee',
      'client/templates/number_parameter.html',
      'client/templates/number_parameter.coffee',
      'client/templates/string_parameter.html',
      'client/templates/string_parameter.coffee',
    ],
    'client'
  );

  api.export('Tweak');
});

Package.onTest(function(api) {
  api.use([
    'coffeescript',
    'fds:tweak',
    'tinytest',
  ]);
  api.addFiles('tests.coffee');
});

