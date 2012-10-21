require 'generators/backbone/helpers'

module Backbone
  module Generators
    class ScaffoldGenerator < Rails::Generators::NamedBase
      include Backbone::Generators::Helpers

      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a Backbone.js resource scaffold"

      class_option :javascript,
                    type: :boolean,
                    aliases: "-j",
                    default: false,
                    desc: "Generate JavaScript"

      def parse_options
        js = options.javascript
        @ext = js ? ".js" : ".js.coffee"
        @jst = js ? ".ejs" : ".eco"
      end

      def create_backbone_model
        file = File.join(model_path, singular_file_name)
        template "model#{@ext}", file
      end

      def create_backbone_collection
        file = File.join(collection_path, plural_file_name)
        template "collection#{@ext}", file
      end

      def create_backbone_router
        file = File.join(router_path, router_file_name)
        template "router#{@ext}", file
      end

      def create_backbone_view
        empty_directory File.join(view_path, file_name.pluralize)
        file = File.join(view_path, file_name.pluralize, view_file_name)
        template "view#{@ext}", file
      end

      def create_backbone_template
        empty_directory File.join(template_path, file_name.pluralize)
        file = File.join(template_path, file_name.pluralize, "index.jst#{@jst}")
        template "template.jst#{@jst}", file
      end

    end
  end
end
