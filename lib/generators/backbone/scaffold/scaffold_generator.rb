require 'generators/backbone/helpers'

module Backbone
  module Generators
    class ScaffoldGenerator < Rails::Generators::NamedBase
      include Backbone::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a Backbone.js resource scaffold"

      class_option :javascript, :type => :boolean, :aliases => "-j", :default => false,
                                :desc => "Generate JavaScript"

      def parse_options
        js = options[:javascript]
        @ext = js ? ".js" : ".js.coffee"
        @jst = js ? ".ejs" : ".eco"
      end

      def create_backbone_model
        template "model#{@ext}", File.join(js_path, namespaced_path, "models", "#{file_name.singularize}#{@ext}")
      end

      def create_backbone_collection
        template "collection#{@ext}",  File.join(js_path, namespaced_path, "collections", "#{file_name.pluralize}#{@ext}")
      end

      def create_backbone_router
        template "router#{@ext}",  File.join(js_path, namespaced_path, "routers", "#{file_name.pluralize}#{@ext}")
      end

      def create_backbone_view
        empty_directory File.join(js_path, namespaced_path, "views", file_name.pluralize)
        template "view#{@ext}",  File.join(js_path, namespaced_path, 'views', file_name.pluralize, "index#{@ext}")
      end

      def create_backbone_template
        empty_directory File.join(template_path, namespaced_path, file_name.pluralize)
        template "template.jst#{@jst}",  File.join(template_path, namespaced_path, file_name.pluralize, "index.jst#{@jst}")
      end

    end
  end
end
