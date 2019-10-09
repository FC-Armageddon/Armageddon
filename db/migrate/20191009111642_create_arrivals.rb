class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.integer :cd_id,   index: true
      t.integer :arrival

      t.timestamps
    end
  end
end
