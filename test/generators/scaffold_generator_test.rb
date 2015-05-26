require 'test_helper'
require 'generators/backbone/helpers'
require "generators/backbone/scaffold/scaffold_generator"

class ScaffoldGeneratorTest < Rails::Generators::TestCase

  tests Backbone::Generators::ScaffoldGenerator

  # Include custom helpers
  include Backbone::Generators::Helpers

  # Generator output directory ('Rails.root')
  destination File.expand_path("../../tmp", __FILE__)

  # Erase destination directory
  setup :prepare_destination

  test "model coffee file is created" do
    run_generator ['planet']
    assert_file "#{model_path}/planet.js.coffee" do |content|
      assert_match('class Dummy.Models.Planet', content)
    end
  end

  test "model coffee file is created with custom Appname" do
    run_generator ['planet', '-a=Custom']
    assert_file "#{model_path}/planet.js.coffee" do |content|
      assert_match('class Custom.Models.Planet', content)
    end
  end

  test "model coffee file is created in a subdir" do
    run_generator ['planet', '--dir=custom']
    assert_file "app/assets/javascripts/custom/models/planet.js.coffee" do |content|
      assert_match('class Dummy.Models.Planet', content)
    end
  end

  test "model javascript file is created" do
    run_generator ['planet', '--javascript']
    assert_file "#{model_path}/planet.js" do |content|
      assert_match('Dummy.Models.Planet = Backbone.Model.extend', content)
    end
  end

  test "collection coffee file is created" do
    run_generator ['planet']
    assert_file "#{collection_path}/planets.js.coffee" do |content|
      assert_match('class Dummy.Collections.Planets', content)
      assert_match('model: Dummy.Models.Planet', content)
    end
  end

  test "collection coffee file is created with custom App" do
    run_generator ['planet', '-a=Custom']
    assert_file "#{collection_path}/planets.js.coffee" do |content|
      assert_match('class Custom.Collections.Planets', content)
      assert_match('model: Custom.Models.Planet', content)
    end
  end

  test "collection coffee file is created in a subdir" do
    run_generator ['planet', '--dir=custom', '--app=Custom']
    assert_file "app/assets/javascripts/custom/collections/planets.js.coffee" do |content|
      assert_match('class Custom.Collections.Planets', content)
      assert_match('model: Custom.Models.Planet', content)
    end
  end

  test "collection javascript file is created" do
    run_generator ['planet', '--javascript']
    assert_file "#{collection_path}/planets.js" do |content|
      assert_match('Dummy.Collections.Planets = Backbone.Collection.extend', content)
      assert_match('model: Dummy.Models.Planet', content)
    end
  end

  test "router coffee file is created" do
    run_generator ['planet']
    assert_file "#{router_path}/planets_router.js.coffee" do |content|
      assert_match('class Dummy.Routers.Planets', content)
    end
  end

  test "router javascript file is created" do
    run_generator ['planet', '--javascript']
    assert_file "#{router_path}/planets_router.js" do |content|
      assert_match('Dummy.Routers.Planets = Backbone.Router.extend', content)
    end
  end

  test "router coffee file is created in a subdir" do
    run_generator ['planet', '--dir=custom']
    assert_file "app/assets/javascripts/custom/routers/planets_router.js.coffee" do |content|
      assert_match('class Dummy.Routers.Planets', content)
    end
  end

  test "router coffee file is created with custom appname" do
    run_generator ['planet', '-a=Custom']
    assert_file "#{router_path}/planets_router.js.coffee" do |content|
      assert_match('class Custom.Routers.Planets', content)
    end
  end

  test "view coffee file is created" do
    run_generator ['planet']
    assert_file "#{view_path}/planets/planets_index.js.coffee" do |content|
      assert_match('class Dummy.Views.PlanetsIndex', content)
      assert_match("template: JST['planets/index']", content)
    end
  end

  test "view coffee file is created in subdir" do
    run_generator ['planet', '-d=custom']
    assert_file "app/assets/javascripts/custom/views/planets/planets_index.js.coffee" do |content|
      assert_match('class Dummy.Views.PlanetsIndex', content)
      assert_match("template: JST['custom/planets/index']", content)
    end
  end

  test "view javascript file is created" do
    run_generator ['planet', '--javascript']
    assert_file "#{view_path}/planets/planets_index.js" do |content|
      assert_match('Dummy.Views.PlanetsIndex = Backbone.View.extend', content)
      assert_match("template: JST['planets/index']", content)
    end
  end

  test "view coffee file is created with a different template controller" do
    run_generator ['planet', '--template_namespace=SHT']
    assert_file "#{view_path}/planets/planets_index.js.coffee" do |content|
      assert_match('class Dummy.Views.PlanetsIndex', content)
      assert_match("template: SHT['planets/index']", content)
    end
  end

  test "view javascript file is created with a different template controller" do
    run_generator ['planet', '--javascript', '--template_namespace=SHT']
    assert_file "#{view_path}/planets/planets_index.js" do |content|
      assert_match('Dummy.Views.PlanetsIndex = Backbone.View.extend', content)
      assert_match("template: SHT['planets/index']", content)
    end
  end

  test "view coffee file is created with custom appname" do
    run_generator ['planet', '-a=Custom']
    assert_file "#{view_path}/planets/planets_index.js.coffee" do |content|
      assert_match('class Custom.Views.PlanetsIndex', content)
      assert_match("template: JST['planets/index']", content)
    end
  end

  test "template eco file is created with handlebars" do
    run_generator ['planet', '--template=hbs']
    assert_file "#{template_path}/planets/index.hbs"
  end

  test "template eco file is created" do
    run_generator ['planet']
    assert_file "#{template_path}/planets/index.jst.eco"
  end

  test "template eco file is created in subdir" do
    run_generator ['planet', '-d=custom']
    assert_file "app/assets/templates/custom/planets/index.jst.eco"
  end

  test "template jst file is created" do
    run_generator ['planet', '--javascript']
    assert_file "#{template_path}/planets/index.jst.ejs"
  end

end
