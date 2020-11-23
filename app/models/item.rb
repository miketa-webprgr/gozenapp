class Item < ApplicationRecord
  before_destroy :destroy_related_set_menus, unless: :set_menu?

  # カレーセットに属するfood_idを取得するassociation
  has_many :food_relationships, class_name: 'Relationship', foreign_key: 'set_menu_id', dependent: :destroy

  # コーヒーが属するset_menu_idを取得するassociation
  has_many :set_menu_relationships, class_name: 'Relationship', foreign_key: 'food_id', dependent: :destroy

  # カレーセットからカレー・サラダ・コーヒーを取得する
  has_many :foods, through: :food_relationships

  # コーヒーからカレーセットやケーキセットを取得する
  has_many :set_menus, through: :set_menu_relationships

private 

  def destroy_related_set_menus
    Item.where(id: set_menu_ids).destroy_all
  end

  def set_menu?
    foods.exists?
  end
end
