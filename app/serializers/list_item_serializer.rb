class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :purchased, :quantity
  has_one :list
  has_one :item
end
