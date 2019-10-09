class CreatePurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_histories do |t|
      t.integer :buy_informations_id
      t.text :cd_name
      t.integer :price

      t.timestamps
    end
  end
end
