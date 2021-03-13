class Document < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  belongs_to :type
  has_many_attached :photos
end
