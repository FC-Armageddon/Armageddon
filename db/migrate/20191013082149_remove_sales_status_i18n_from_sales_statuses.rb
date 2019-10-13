class RemoveSalesStatusI18nFromSalesStatuses < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales_statuses, :sales_status_i18n, :integer
  end
end
