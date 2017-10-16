class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.decimal :price
      t.references :item, foreign_key: true
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
