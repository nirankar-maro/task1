class Gallery < ApplicationRecord
  mount_uploader :image, PhotoUploader
  paginates_per 5
  belongs_to :user
  validates_presence_of :name,:image
  validates :name, :uniqueness => true

end
