class ListSerializer < ActiveModel::Serializer
  attributes :id, :active, :name, :updated_at
  has_many :list_items
end
