class PriceSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :item
  has_one :store
end
