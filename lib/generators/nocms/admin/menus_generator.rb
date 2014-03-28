module NoCms
  module Admin
    class MenusGenerator < Rails::Generators::Base

      source_root File.expand_path("../templates/", __FILE__)

      def generate_nocms_menus_initializer
        template "config/initializers/nocms/admin/menus.rb", File.join(destination_root, "config", "initializers", "nocms", "admin", "menus.rb")
      end

      def self.namespace
        "nocms:admin:menus"
      end

    end
  end
end
