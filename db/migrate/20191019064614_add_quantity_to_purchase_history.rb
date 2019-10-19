class AddQuantityToPurchaseHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_histories, :quantity, :integer
  end
end
