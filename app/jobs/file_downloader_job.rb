# Job for generate CSV fiel
class FileDownloaderJob < ApplicationJob
  queue_as :default
  def perform(all)
    attributes = %w[room_id arrive departure verified  user_id]
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.where(verified: true).each do |booking|
        csv << booking.attributes.values_at(*attributes)
      end
    end
  end
end
