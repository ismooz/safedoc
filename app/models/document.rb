class Document < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :document_types, dependent: :destroy
  has_many_attached :photos
  has_many :types, through: :document_types
  validates :name, :photos, presence: true

  def expire
    (deadline - Date.current).to_i if deadline
  end

end
