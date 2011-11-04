
    B a c k b o n e   o n   R a i l s

    }=}=}=}=}=}=}=}=}=}=}=}=}=}=}=}=}


      A simple gem for using Backbone with Rails -> 3.1


    Features
    --------

      * Vendors the latest Backbone.js + Underscore.js in the asset pipeline

      * Install generator to create a skeleton[1] directory structure and manifest

      * Scaffold generator to create files and boilerplate

      * Uses the naming conventions from
        thoughbot's 'Backbone.js on Rails' http://bit.ly/pLsmzr

      * Generates CoffeeScript (default) or JavaScript


    Usage
    -----

      gem 'backbone-on-rails'

      bundle install

      rails generate backbone:install

      rails generate backbone:scaffold cat


    Tricks
    ------

      rails generate backbone:install -j,   # Generate JavaScript

      rails destroy backbone:scaffold cat   # Remove generated files


    Alternatives
    ------------

      For other features check out:

      * https://github.com/codebrew/backbone-rails
      * https://github.com/aflatter/backbone-rails


    [1] http://bit.ly/h4sy
