require 'generators/backbone/helpers'
require 'rails'

module Backbone
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Backbone::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a Backbone.js skeleton directory structure and manifest"

      class_option :javascript, :type => :boolean, :aliases => "-j", :default => false,
                                :desc => "Generate JavaScript"

      class_option :namespace, :type => :string, :aliases => "-n", :default => '',
                                :desc => "Namespace backbone application in specified directory tree"

      class_option :manifest, :type => :string, :aliases => "-m", :default => 'application.js',
                                :desc => "Javascript manifest file to modify (or create)"

      def inject_backbone
        libs = ['underscore', 'backbone']
        manifest = options[:manifest]
        paths = [ "../templates#{namespaced_path}", ".#{namespaced_path}/models",
                  ".#{namespaced_path}/collections", ".#{namespaced_path}/views", ".#{namespaced_path}/routers"]

        create_file("#{js_path}/#{manifest}") unless File.exists?("#{js_path}/#{manifest}")

        append_to_file "#{js_path}/#{manifest}" do
          out = ""
          out << libs.map{ |lib| "//= require #{lib}" }.join("\n")
          out << "\n//\n"
          out << "//= require .#{app_filename}"
          out << "\n//\n"
          out << paths.map{ |path| "//= require_tree #{path}" }.join("\n")
          out << "\n"
        end
      end

      def create_dir_layout
        %W{collections models routers views}.each do |dir|
          empty_directory "#{js_path}#{namespaced_path}/#{dir}"
        end

        %W{templates}.each do |dir|
          empty_directory "#{asset_path}/#{dir}#{namespaced_path}"
        end
      end

      def create_app_file
        js = options[:javascript]
        ext = js ? ".js" : ".js.coffee"
        template "app#{ext}", "#{js_path}/#{app_filename}#{ext}"
      end

    end
  end
end
