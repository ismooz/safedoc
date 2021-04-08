class Document < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :document_types, dependent: :destroy
  has_many_attached :photos
  has_many :types, through: :document_types
  validates :name, :deadline, :reminder, :photos, presence: true

  def expire
    @expire = (deadline - Date.current).to_i
  end
end
