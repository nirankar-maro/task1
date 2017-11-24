class Gallery < ApplicationRecord
  mount_uploader :image, PhotoUploader
  paginates_per 5
  belongs_to :user
  validates_presence_of :name,:image
  validates :name, :uniqueness => true
  def self.to_csv
    attributes = %w{id name image}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |image|
        csv << attributes.map{ |attr| image.send(attr) }
      end
    end
  end

end
