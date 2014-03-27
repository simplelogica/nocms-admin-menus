NoCms::Admin.menu_items << {
  name: 'menus',
  url: proc { NoCms::Admin::Menus::Engine.routes.url_helpers.menus_path }
}
