class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :group, :frequency, :number, :mean_price
  has_one :item
  has_one :user
end
