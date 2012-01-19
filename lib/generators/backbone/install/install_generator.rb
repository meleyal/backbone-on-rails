require 'generators/backbone/helpers'
require 'rails'

module Backbone
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Backbone::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a Backbone.js skeleton directory structure and mainfest"

      class_option :javascript, :type => :boolean, :aliases => "-j", :default => false,
                                :desc => "Generate JavaScript"

      def inject_backbone
        libs = ['underscore', 'backbone']
        paths = ['../templates', './models', './collections', './views', './routers']

        begin
          file = 'application.js'
          if FileTest.exists?("#{js_path}/application.js.coffee")
            file = 'application.js.coffee'
          end
        rescue
          # TODO: catch error, show feedback
        end

        inject_into_file "#{js_path}/#{file}", :before => "//= require_tree" do
          out = ""
          out << libs.map{ |lib| "//= require #{lib}" }.join("\n")
          out << "\n\n"
          out << "//= require #{app_filename}"
          out << "\n\n"
          out << paths.map{ |path| "//= require_tree #{path}" }.join("\n")
          out << "\n"
        end
      end

      def create_dir_layout
        %W{collections models routers views}.each do |dir|
          empty_directory "#{js_path}/#{dir}"
        end

        %W{templates}.each do |dir|
          empty_directory "#{asset_path}/#{dir}"
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
