# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_many :group_memberships
  has_many :users, through: :group_memberships
  validates :name, :user, presence: true
end
