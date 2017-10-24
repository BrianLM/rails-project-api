class AddGroupToLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :lists, :group, foreign_key: true
  end
end
