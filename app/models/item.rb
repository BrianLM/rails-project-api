class Item < ApplicationRecord
  has_many :list_items
  has_many :list_items, through: :lists
end
