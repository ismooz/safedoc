class ChangeFolderReferences < ActiveRecord::Migration[6.0]
   def change
    rename_column(:folders, :parent_id, :folder_id)
  end
end
