class RenameColumn < ActiveRecord::Migration[5.2]
  def change
  	rename_column :buy_infomations, :delivery_status_i18n, :delivery_status
  	rename_column :buy_infomations, :payment_i18n, :payment
  end
end
