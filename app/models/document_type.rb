class DocumentType < ApplicationRecord
  belongs_to :document
  belongs_to :type
end
