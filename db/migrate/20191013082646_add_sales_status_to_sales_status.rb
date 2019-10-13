class AddSalesStatusToSalesStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_statuses, :sales_status, :text
  end
end
