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

  def expire_string
    if deadline
      days = expire
      if days > 365
        years = (days/365).round(0)
        days = days - (years * 365)
        years.equal?(1) ? "Expire in #{years} year #{days} days" : "Expire in #{years} years #{days} days"
      else
        "Expire in #{days} days"
      end
    end
  end
end
