class RemoveDeliveryStatusI18nFromBuyInfomations < ActiveRecord::Migration[5.2]
  def change
    remove_column :buy_infomations, :delivery_status_i18n, :integer
  end
end
