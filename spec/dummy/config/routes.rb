Rails.application.routes.draw do
  mount NoCms::Admin::Engine => "/admin"
  mount NoCms::Admin::Menus::Engine => "/admin"
end
