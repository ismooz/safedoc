class AddValidationDateToUser < ActiveRecord::Migration[6.0]
  def change
        add_column :users, :chk_box_validation, :date
  end
end
