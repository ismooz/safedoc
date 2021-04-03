class AddColumnChckboxBool < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :chk_box_validation, :boolean
  end
end
