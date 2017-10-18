class AddGroupToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :group, :bigint
  end
end
