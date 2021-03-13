class RemoveReferencesFromDocuments < ActiveRecord::Migration[6.0]
  def change
    remove_reference :documents, :type, foreign_key: true
  end
end
