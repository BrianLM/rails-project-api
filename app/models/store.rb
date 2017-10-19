# frozen_string_literal: true

class Store < ApplicationRecord
  validates :name, :location, :user, presence: true
  belongs_to :user
end
