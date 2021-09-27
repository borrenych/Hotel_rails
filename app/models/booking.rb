# Model for booking system
class Booking < ApplicationRecord
  belongs_to :room, inverse_of: :bookings
  belongs_to :user, inverse_of: :bookings
  validate :no_past_booking
  validates :arrive, :departure, presence: true
  # self.abstract_class = true
  def self.to_csv
    FileDownloaderJob.new.perform(all)
  end
  # validate :overlaps

  def no_past_booking
    errors.add(:arrive, 'cannot be in the past') if Date.today > arrive.to_date || Time.now > arrive.to_time
    errors.add(:departure, 'cannot be in the past') if Date.today > departure.to_date || Time.now > departure.to_time
  end
end
