module Backbone
  module Generators
    module Helpers

      def asset_path
        "app/assets"
      end

      def js_path
        "#{asset_path}/javascripts"
      end

      def template_path
        "#{asset_path}/templates"
      end

      def model_namespace
        [app_name, "Models", file_name.singularize.camelize].join(".")
      end

      def collection_namespace
        [app_name, "Collections", file_name.pluralize.camelize].join(".")
      end

      def router_namespace
        [app_name, "Routers", file_name.pluralize.camelize].join(".")
      end

      def view_namespace
        [app_name, "Views", "#{file_name.pluralize.camelize}Index"].join(".")
      end

      def template_namespace
        [file_path.pluralize, "index"].join("/")
      end

      def app_name
        rails_app_name.camelize + namespaces.map!{ |n| n.camelize }.join('')
      end

      def app_filename
        "#{namespaced_path}/#{rails_app_name.underscore}"
      end

      def rails_app_name
        Rails.application.class.name.split('::').first
      end

      def namespaces
        options[:namespace] ? options[:namespace].split('/') : file_path.split('/')[0...-1]
      end

      def namespaced_path
        '/' + namespaces.join('/')
      end

    end
  end
end
