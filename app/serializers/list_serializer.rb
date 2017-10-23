# frozen_string_literal: true

class ListSerializer < ActiveModel::Serializer
  attributes :id, :active, :name, :updated_at, :complete
  has_many :list_items

  def complete
    @object.list_items.collect.all?(&:purchased)
  end
end
