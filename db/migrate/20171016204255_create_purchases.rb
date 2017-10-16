class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :group
      t.integer :frequency
      t.integer :number
      t.decimal :mean_price
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
