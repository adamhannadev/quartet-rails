class Recording < ApplicationRecord
  belongs_to :user
  has_one_attached :rec_file
  has_and_belongs_to_many :mixes
end
