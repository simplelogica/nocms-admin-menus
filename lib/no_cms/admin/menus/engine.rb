module NoCms
  module Admin
    module Menus
      class Engine < ::Rails::Engine
        isolate_namespace NoCms::Admin::Menus

        config.to_prepare do
          Dir.glob(NoCms::Admin::Menus::Engine.root + "app/decorators/**/*_decorator*.rb").each do |c|
            require_dependency(c)
          end
        end

      end
    end
  end
end
