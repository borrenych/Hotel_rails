class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploaders :attachments, ImageUploader
  has_many :bookings, dependent: :destroy
end
