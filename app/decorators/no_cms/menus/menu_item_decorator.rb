NoCms::Menus::MenuItem.class_eval do

  validates :kind, presence: true
  def menu_kind
    NoCms::Menus.menu_kinds[self.kind]
  end
end
