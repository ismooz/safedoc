class Folder < ApplicationRecord
  belongs_to :parent, class_name: "Folder", optional: true
  # has_many :folders
  has_many :documents
end
