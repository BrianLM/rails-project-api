class GroupMembershipSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_one :group
  has_one :user
  def email
    @object.user.email
  end
end
