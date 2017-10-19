class ListSerializer < ActiveModel::Serializer
  attributes :id, :active
  has_many :list_items
end
