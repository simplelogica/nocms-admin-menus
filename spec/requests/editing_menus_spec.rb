require 'spec_helper'

describe NoCms::Admin::Menus do

  context "when editing a menu", js: true do

    let(:no_cms_menu) { create :no_cms_menus_menu }
    let(:no_cms_menu_item) { create :no_cms_menus_menu_item, menu: no_cms_menu }

    let(:menu_name) { Faker::Lorem.sentence }

    subject { page }

    before do

      no_cms_menu_item

      visit no_cms_admin_menus.edit_menu_path(no_cms_menu)

      within('#content_fields') do
        fill_in I18n.t('activerecord.attributes.no_cms/menus/menu.name'), with: menu_name
      end

      click_button(I18n.t('no_cms.admin.menus.menus.toolbar_right.submit'))
    end

    it "should show the menu in the admin index" do
      expect(current_path).to eq no_cms_admin_menus.edit_menu_path  NoCms::Menus::Menu.first
      expect(subject).to have_selector 'li', text: menu_name
    end

  end
end
