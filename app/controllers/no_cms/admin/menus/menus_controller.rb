require_dependency "no_cms/admin/menus/application_controller"

module NoCms::Admin::Menus
  class MenusController < ApplicationController

    before_filter :load_menu_section
    before_filter :load_menus, only: [:index]

    def new
      @menu = NoCms::Menus::Menu.new
    end

    private

    def load_menus
      @menus =  NoCms::Menus::Menu.all
    end

    def load_menu_section
      @current_section = 'menus'
    end
  end
end
