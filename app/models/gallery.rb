class Gallery < ApplicationRecord
  mount_uploader :image, PhotoUploader
  paginates_per 5
  belongs_to :user
end
