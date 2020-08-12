class Mix < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :recordings
  has_one_attached :mixed_file
end
