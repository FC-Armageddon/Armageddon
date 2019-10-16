class AddDeliveryStatusI18nToBuyInformations < ActiveRecord::Migration[5.2]
  def change
    add_column :buy_infomations, :delivery_status_i18n, :integer, default: 1
  end
end
