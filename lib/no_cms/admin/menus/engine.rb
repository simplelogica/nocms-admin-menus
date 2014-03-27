module NoCms
  module Admin
    module Menus
      class Engine < ::Rails::Engine
        isolate_namespace NoCms::Admin::Menus
      end
    end
  end
end
