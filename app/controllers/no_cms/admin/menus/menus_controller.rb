require_dependency "no_cms/admin/menus/application_controller"

module NoCms::Admin::Menus
  class MenusController < ApplicationController

    before_filter :load_menu_section
    before_filter :load_menus, only: [:index, :new, :edit]
    before_filter :load_menu, only: [:edit, :update]

    def new
      @menu = NoCms::Menus::Menu.new
    end

    def create
      @menu = NoCms::Menus::Menu.new menu_params
      if @menu.save
        @nocms_logger.info(I18n.t('.no_cms.admin.menus.menus.create.success'), true)
        redirect_to edit_menu_path(@menu)
      else
        @nocms_logger.error(I18n.t('.no_cms.admin.menus.menus.create.error'))
        load_menus
        render :new
      end
    end

    def update
      if @menu.update_attributes menu_params
        @nocms_logger.info(I18n.t('.no_cms.admin.menus.menus.update.success'), true)
        redirect_to edit_menu_path(@menu)
      else
        @nocms_logger.error(I18n.t('.no_cms.admin.menus.menus.update.error'))
        load_menus
        render :new
      end
    end

    private

    def load_menus
      @menus =  NoCms::Menus::Menu.all
    end

    def load_menu
      @menu = NoCms::Menus::Menu.find(params[:id])
    end

    def load_menu_section
      @current_section = 'menus'
    end

    def menu_params
      menu_params = params.require(:menu).permit(:name, :uid)
    end

  end
end
