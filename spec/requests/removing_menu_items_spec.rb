require 'spec_helper'

describe NoCms::Admin::Menus do

  context "when removing a menu item", js: true do

    let(:no_cms_menu) { create :no_cms_menus_menu }
    let(:no_cms_menu_item) { create :no_cms_menus_menu_item, menu: no_cms_menu }

    subject { page }

    before do
      no_cms_menu_item

      visit no_cms_admin_menus.edit_menu_path no_cms_menu


      within("#content_block_#{no_cms_menu_item.id}") do
        click_link I18n.t('no_cms.admin.menus.menu_items.form.remove')
      end

      click_button(I18n.t('no_cms.admin.menus.menus.toolbar_right.submit'))

    end

    it "should not show the menu in the admin index" do
      expect(current_path).to eq no_cms_admin_menus.edit_menu_path no_cms_menu
      expect(subject).to_not have_selector "#content_block_#{no_cms_menu_item.id}"
    end

  end
end
