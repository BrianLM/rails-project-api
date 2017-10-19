class AddStoreToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_reference :purchases, :store, foreign_key: true
  end
end
