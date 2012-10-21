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

  test "view coffee file is created" do
    run_generator ['planet']
    assert_file "#{view_path}/planets/planets_index.js.coffee" do |content|
      assert_match('class Dummy.Views.PlanetsIndex', content)
      assert_match("template: JST['planets/index']", content)
    end
  end

  test "view javascript file is created" do
    run_generator ['planet', '--javascript']
    assert_file "#{view_path}/planets/planets_index.js" do |content|
      assert_match('Dummy.Views.PlanetsIndex = Backbone.View.extend', content)
      assert_match("template: JST['planets/index']", content)
    end
  end

  test "template eco file is created" do
    run_generator ['planet']
    assert_file "#{template_path}/planets/index.jst.eco"
  end

  test "template jst file is created" do
    run_generator ['planet', '--javascript']
    assert_file "#{template_path}/planets/index.jst.ejs"
  end

end
