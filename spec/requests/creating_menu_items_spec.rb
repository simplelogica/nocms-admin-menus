require 'spec_helper'

describe NoCms::Admin::Menus do

 context "when creating a new menu item", js: true do

  let(:no_cms_menu) { create :no_cms_menus_menu }
  let(:menu_item_name) { Faker::Lorem.sentence }

  subject { page }

  before do
    no_cms_menu

    visit no_cms_admin_menus.edit_menu_path(no_cms_menu)

    click_link(I18n.t('no_cms.admin.menus.menu_items.index.new_block'))

    within('.block.row') do
      fill_in I18n.t('activerecord.attributes.no_cms/menus/menu_item.name'), with: menu_item_name

        select I18n.t('no_cms.admin.menus.menus.kinds.fixed_url'), from: 'menu_menu_items_attributes_0_kind'
    end

    click_button(I18n.t('no_cms.admin.menus.menus.toolbar_right.submit'))
  end

  it "should show the menu item in the admin index" do
    expect(current_path).to eq no_cms_admin_menus.edit_menu_path NoCms::Menus::Menu.first
    expect(subject).to have_selector '.title', text: menu_item_name
  end

 end


 context "when creating a new nested menu item", js: true do

  let(:no_cms_menu) { create :no_cms_menus_menu }
  let(:no_cms_menu_item) { create :no_cms_menus_menu_item, menu: no_cms_menu }
  let(:nested_menu_item_name) { Faker::Lorem.sentence }

  subject { page }

  before do
    no_cms_menu_item

    visit no_cms_admin_menus.edit_menu_path(no_cms_menu)

  end

   it "should show a 'new child block'" do
      expect(page).to have_selector "#content_block_#{no_cms_menu_item.id} .new_content_block"
    end

    it "should create a 'new child block'" do

      expect(page).to_not have_selector "#content_block_#{no_cms_menu_item.id} .block"

      within "#content_block_#{no_cms_menu_item.id}" do
        click_link I18n.t('no_cms.admin.menus.menu_items.nested_index.new_block')
      end

      expect(page).to have_selector "#content_block_#{no_cms_menu_item.id} .block"

      within("#content_block_#{no_cms_menu_item.id} .block") do
        fill_in I18n.t('activerecord.attributes.no_cms/menus/menu_item.name'), with: nested_menu_item_name
        select I18n.t('no_cms.admin.menus.menus.kinds.fixed_url'), from: 'menu_menu_items_attributes_0_children_attributes_0_kind'
      end

      click_button(I18n.t('no_cms.admin.menus.menus.toolbar_right.submit'))

      expect(page).to have_selector('.title', text: nested_menu_item_name)
    end

 end
end
