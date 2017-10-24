class RemoveColumnFromLists < ActiveRecord::Migration[5.1]
  def change
    remove_column :lists, :group, :bigint
  end
end
