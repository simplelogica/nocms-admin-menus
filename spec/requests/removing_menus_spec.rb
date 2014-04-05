require 'spec_helper'

describe NoCms::Admin::Menus do

  context "when removing a menu", js: true do

    let(:no_cms_menu) { create :no_cms_menus_menu }

    subject { page }

    before do
      no_cms_menu

      visit no_cms_admin_menus.menus_path

      click_button I18n.t('no_cms.admin.menus.menus.menu_listing_item.destroy')
    end

    it "should not show the menu in the admin index" do
      expect(current_path).to eq no_cms_admin_menus.menus_path
      expect(subject).to_not have_selector 'li', text: no_cms_menu.name
    end

  end
end
