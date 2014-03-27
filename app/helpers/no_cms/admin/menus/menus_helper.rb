module NoCms
  module Admin
    module Menus
      module MenusHelper
        def menu_listing_item_classes menu, current_menu = nil
          classes = []
          classes << 'current' if current_menu == menu
          classes
        end
      end
    end
  end
end
