class Relationship < ApplicationRecord
  belongs_to :food, class_name: 'Item'
  belongs_to :set_menu, class_name: 'Item'
end