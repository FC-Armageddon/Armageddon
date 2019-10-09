class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :cd_id,         index: true
      t.integer :user_id,       index: true
      t.integer :quantity
      t.boolean :deleted_flag,  default: "false"

      t.timestamps
    end
  end
end
