require 'generators/backbone/helpers'

module Backbone
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Backbone::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a Backbone.js skeleton directory structure and manifest"

      class_option :javascript,
                    type: :boolean,
                    aliases: "-j",
                    default: false,
                    desc: "Generate JavaScript"

      class_option :manifest,
                    type: :string,
                    aliases: "-m",
                    default: "application.js",
                    desc: "Javascript manifest file to modify (or create)"

      def create_dir_layout
        empty_directory model_path
        empty_directory collection_path
        empty_directory router_path
        empty_directory view_path
        empty_directory template_path
      end

      def create_app_file
        js = options.javascript
        ext = js ? ".js" : ".js.coffee"
        template "app#{ext}", "#{javascript_path}/#{app_filename}#{ext}"
      end

      def inject_backbone
        manifest = File.join(javascript_path, options.manifest)
        libs = %w(underscore backbone)
        paths = %w(../templates ./models ./collections ./views ./routers)

        out = []
        out << libs.map{ |lib| "//= require #{lib}" }
        out << "//= require #{app_filename}"
        out << paths.map{ |path| "//= require_tree #{path}" }
        out = out.join("\n") + "\n"

        in_root do
          create_file(manifest) unless File.exists?(manifest)
          if File.open(manifest).read().include?('//= require_tree')
            inject_into_file(manifest, out, before: '//= require_tree')
          else
            append_file(manifest, out)
          end
        end
      end

    end
  end
end
