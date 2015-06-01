Backbone on Rails
=================

A simple gem for using Backbone.js with Rails.

http://git.io/backbone-on-rails


Features
--------

* Vendors the latest Backbone.js + Underscore.js in the asset pipeline

* Provides an install generator to create a skeleton directory
  structure and manifest

* Provides a scaffold generator to create files and boilerplate

* Uses the naming conventions from
  thoughtbot's [Backbone.js on Rails](http://bit.ly/pLsmzr)

* Generates CoffeeScript (default) or JavaScript


Usage
-----

    gem 'backbone-on-rails'

    bundle install

    rails generate backbone:install

    rails generate backbone:scaffold NAME

*Note: Remember to restart the server after installing*

See also:

* http://railscasts.com/episodes/323-backbone-on-rails-part-1
* http://railscasts.com/episodes/325-backbone-on-rails-part-2


Output
------

Example output from backbone:scaffold planet

    app/assets/
    ├── javascripts
    │   ├── application.js
    │   ├── space_app.js.coffee
    │   ├── collections
    │   │   └── planets.js.coffee
    │   ├── models
    │   │   └── planet.js.coffee
    │   ├── routers
    │   │   └── planets_router.js.coffee
    │   └── views
    │       └── planets
    │           └── planets_index.js.coffee
    └── templates
        └── planets
            └── index.jst.eco


Tricks
------

    # Custom manifest
    rails generate backbone:install --manifest index.js

    # Generate JavaScript
    rails generate backbone:install --javascript

    # Custom Appname
    rails generate backbone:install --app=CustomApp

    # Place code within a sub directory structure
    rails generate backbone:install --dir=custom_app

    # Remove generated files
    rails destroy backbone:scaffold planet

    # Create a custom app name
    rails generate backbone:scaffold planet -a=CustomApp

    # Generate scaffold in sub directory of assets/javascripts & assets/templates
    rails generate backbone:scaffold planet -d=custom_app

    # Use Handlebars File instead of JST
    rails generate backbone:scaffold planet --template=hbs

    # Use SHT instead of JST as template namespace
    rails generate backbone:scaffold planet --template_namespace=SHT

Alternatives
------------

For other features check out:

* https://github.com/codebrew/backbone-rails
* https://github.com/aflatter/backbone-rails
