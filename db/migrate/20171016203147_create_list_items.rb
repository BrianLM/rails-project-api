class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.boolean :purchased
      t.integer :quantity
      t.references :list, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
