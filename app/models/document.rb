class Document < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  belongs_to :type
end
