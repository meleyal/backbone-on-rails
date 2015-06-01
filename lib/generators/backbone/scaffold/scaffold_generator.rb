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

      class_option :app,
                    type: :string,
                    aliases: "-a",
                    default: nil,
                    desc: "Application Name"

      class_option :dir,
                    type: :string,
                    aliases: "-d",
                    default: nil,
                    desc: "Subdirectory for files"

      class_option :template,
                    type: :string,
                    default: "ejs",
                    desc: "Extension for template files"

      class_option :template_namespace,
                    type: :string,
                    default: "JST",
                    desc: "Template namespace (ex: JST / SHT / and so on)"

      def parse_options
        js = options.javascript
        @ext = js ? ".js" : ".js.coffee"
        @rails_app_name = options.app
        @subdirname = options.dir
      end

      def parse_javascript_templates
        js = options.javascript

        # Add additional formats here if we'd like to extend.
        # => 2015/05/26 Added Handlebars Templates.
        #
        @jst = case options.template
          when 'hbs'
            'hbs'
          else
            js ? 'jst.ejs' : 'jst.eco'
        end

        # Instead of re-writing the template portion of the JS repeatedly, adding an option to allow custom object name for templates
        @template_controller = options.template_namespace
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
        file = File.join(template_path, file_name.pluralize, "index.#{@jst}")
        template "template.#{@jst}", file
      end

    end
  end
end
