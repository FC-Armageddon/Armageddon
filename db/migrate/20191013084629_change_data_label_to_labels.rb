class ChangeDataLabelToLabels < ActiveRecord::Migration[5.2]
  def change
  	change_column :labels, :label, :text
  end
end
