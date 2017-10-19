# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :frequency, :number, :mean_price, :item, :user, presence: true
end
