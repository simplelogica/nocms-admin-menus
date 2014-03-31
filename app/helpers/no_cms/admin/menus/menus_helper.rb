module NoCms
  module Admin
    module Menus
      module MenusHelper
        def menu_listing_item_classes menu, current_menu = nil
          classes = []
          classes << 'current' if current_menu == menu
          classes
        end

        def menu_item_form_classes menu_item
          classes = []
          classes << 'new' if menu_item.new_record?
          classes
        end

        def menu_item_form_id menu_item
          menu_item.new_record? ?
          "new_content_block_#{menu_item.kind}" :
          "content_block_#{menu_item.id}"
        end

        def render_menu_item_partial form
          menu_item = form.object
          case
          when !menu_item.menu_kind[:object_class].nil?
            options = menu_item.menu_kind[:object_class].all
            render 'no_cms/admin/menus/menu_items/object_form', menu_item: menu_item, f: form, options: options
          when !menu_item.menu_kind[:action].nil?
            render 'no_cms/admin/menus/menu_items/action_form', menu_item: menu_item, f: form
          else
            'zxvzxcvzxv'
          end
        end
      end
    end
  end
end
