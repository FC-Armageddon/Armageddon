class CreateBuyInfomations < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_infomations do |t|
      t.integer :user_id,          index: true
      t.integer :payment_i18n
      t.integer :delivery_status_i18n
      t.integer :subtotal
      t.text :final_postal_code
      t.text :final_address
      t.text :final_name

      t.timestamps
    end
  end
end
