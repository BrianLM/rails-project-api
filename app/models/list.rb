# frozen_string_literal: true

class List < ApplicationRecord
  has_many :list_items, dependent: :destroy
  has_many :items, through: :list_items
  has_one :group
end
