class BackingTrack < ApplicationRecord
  belongs_to :user
  has_one_attached :track
end
