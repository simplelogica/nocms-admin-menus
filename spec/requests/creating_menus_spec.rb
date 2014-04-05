require 'spec_helper'

describe NoCms::Admin::Menus do

 context "when creating a new menu", js: true do
  let(:menu_name) { Faker::Lorem.sentence }
  let(:menu_uid) { Faker::Lorem.sentence.parameterize }

  subject { page }

  before do
    visit no_cms_admin_menus.new_menu_path

    fill_in I18n.t('activerecord.attributes.no_cms/menus/menu.name'), with: menu_name
    fill_in I18n.t('activerecord.attributes.no_cms/menus/menu.uid'), with: menu_uid

    click_button(I18n.t('no_cms.admin.menus.menus.toolbar_right.submit'))
  end

  it "should show the menu in the admin index" do
    expect(current_path).to eq no_cms_admin_menus.edit_menu_path NoCms::Menus::Menu.first
    expect(subject).to have_selector 'li', text: menu_name
  end

 end
end
