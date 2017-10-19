# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :list_items
  has_many :list_items, through: :lists
  validates :name, :unit, :unit_quantity, presence: true
end
