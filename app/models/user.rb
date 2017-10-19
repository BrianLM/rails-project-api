# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :lists, dependent: :destroy
  has_many :items
  has_many :stores
  has_many :groups
  has_many :prices
  has_many :group_memberships
  has_many :purchases
end
