class Recording < ApplicationRecord
  belongs_to :user
  has_one_attached :rec_file
end
