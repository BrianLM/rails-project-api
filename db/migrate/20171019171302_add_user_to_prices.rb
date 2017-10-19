class AddUserToPrices < ActiveRecord::Migration[5.1]
  def change
    add_reference :prices, :user, foreign_key: true
  end
end
