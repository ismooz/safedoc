class Document < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :type, dependent: :destroy
  # belongs_to :type
  has_many_attached :photos

end
