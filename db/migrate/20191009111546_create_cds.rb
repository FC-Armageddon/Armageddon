class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.integer  :genre_id
      t.integer  :label_id
      t.integer  :sales_status_id
      t.integer  :artist_id
      t.text     :cd_name
      t.text     :jacket_image_id
      t.integer  :price
      t.integer  :stock

      t.timestamps
    end
  end
end
