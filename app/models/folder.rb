class Folder < ApplicationRecord
  belongs_to :folder

  has_many :documents
end
