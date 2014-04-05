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
end
