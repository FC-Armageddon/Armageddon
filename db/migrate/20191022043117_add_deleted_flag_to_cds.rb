class AddDeletedFlagToCds < ActiveRecord::Migration[5.2]
  def change
    add_column :cds, :deleted_flag, :boolean, default: false
  end
end
