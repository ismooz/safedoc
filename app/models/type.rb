class Type < ApplicationRecord
  has_many :document_types, dependent: :destroy
  has_many :documents, through: :document_types
end
