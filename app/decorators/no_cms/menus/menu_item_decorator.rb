NoCms::Menus::MenuItem.class_eval do

  validates :kind, presence: true
  def menu_kind
    NoCms::Admin::Menus.menu_kinds[self.kind]
  end
end
