class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :group_memberships
end
