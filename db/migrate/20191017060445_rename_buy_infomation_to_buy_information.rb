class RenameBuyInfomationToBuyInformation < ActiveRecord::Migration[5.2]
  def change
  	rename_table :buy_infomations, :buy_informations
  end
end
