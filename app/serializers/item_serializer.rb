class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit, :unit_quantity
end
