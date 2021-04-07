class ChangeChkBoxValidationType < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :chk_box_validation, :date
  end
end
