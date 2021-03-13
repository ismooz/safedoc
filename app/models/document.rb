class Document < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :type
end
