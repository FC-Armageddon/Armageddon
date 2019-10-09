class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.integer :user_id
      t.text :delivery_postal_code
      t.text :delivery_address
      t.text :delivery_name

      t.timestamps
    end
  end
end
