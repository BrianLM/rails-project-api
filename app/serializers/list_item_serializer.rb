class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :purchased, :quantity, :item
  has_one :list
  has_one :item
end
