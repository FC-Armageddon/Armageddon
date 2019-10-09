class CreateSalesStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_statuses do |t|
      t.integer :sales_status_i18n

      t.timestamps
    end
  end
end
