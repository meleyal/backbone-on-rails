require 'test_helper'
require 'generators/backbone/helpers'
require 'generators/backbone/install/install_generator'

class InstallGeneratorTest < Rails::Generators::TestCase

  tests Backbone::Generators::InstallGenerator
  include Backbone::Generators::Helpers

  # Generator output directory ('Rails.root')
  destination File.expand_path("../../tmp", __FILE__)

  # Erase destination directory
  setup :prepare_destination

  test "directory structure is created" do
    run_generator
    assert_directory "#{javascript_path}/models"
    assert_directory "#{javascript_path}/collections"
    assert_directory "#{javascript_path}/views"
    assert_directory "#{javascript_path}/routers"
    assert_directory "#{asset_path}/templates"
  end

  test "app coffee file is created" do
    run_generator
    assert_file "#{javascript_path}/#{app_filename}.js.coffee"
  end

  test "app javascript file is created" do
    run_generator ['--javascript']
    assert_file "#{javascript_path}/#{app_filename}.js"
  end

  test "require paths are injected into default manifest" do
    copy_manifest
    run_generator
    assert_file "#{javascript_path}/application.js" do |content|
      test_manifest_content(content)
    end
  end

  test "require paths are injected into custom manifest" do
    manifest = 'index.js'
    run_generator ['--manifest', manifest]
    assert_file "#{javascript_path}/#{manifest}" do |content|
      test_manifest_content(content)
    end
  end

  private

  def test_manifest_content(content)
    assert_match(/require underscore\n/, content)
    assert_match(/require backbone\n/, content)
    assert_match(/require #{app_filename}\n/, content)
    assert_match(/require_tree \.\.\/templates\n/, content)
    assert_match(/require_tree \.\/models\n/, content)
    assert_match(/require_tree \.\/collections\n/, content)
    assert_match(/require_tree \.\/views\n/, content)
    assert_match(/require_tree \.\/routers\n/, content)
  end

  def copy_manifest
    manifest = File.expand_path("../../dummy/app/assets/javascripts/application.js", __FILE__)
    destination = File.join destination_root, javascript_path
    FileUtils.mkdir_p destination
    FileUtils.cp manifest, destination
  end

end
