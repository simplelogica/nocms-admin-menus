Rails.application.routes.draw do
  mount NoCms::Admin::Menus::Engine => "/admin"
end
