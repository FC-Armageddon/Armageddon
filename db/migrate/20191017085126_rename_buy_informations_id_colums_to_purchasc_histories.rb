class RenameBuyInformationsIdColumsToPurchascHistories < ActiveRecord::Migration[5.2]
  def change
  	rename_column :purchase_histories, :buy_informations_id, :buy_information_id
  end
end
