# frozen_string_literal: true

class Price < ApplicationRecord
  belongs_to :item
  belongs_to :store
  validates :price, :item, :store, presence: true
end
