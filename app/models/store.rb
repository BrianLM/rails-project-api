# frozen_string_literal: true

class Store < ApplicationRecord
  validates :name, :location, :user, presence: true
end
