class Folder < ApplicationRecord
  belongs_to :parent, class_name: "Folder", optional: true
  has_many :folders, foreign_key: "folder_id", dependent: :destroy
  has_many :documents, dependent: :destroy
end
