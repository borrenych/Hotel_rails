# controller for bookings at admin interface
class Admin::BookingsController < ApplicationController
  before_action :set_booking, only: %i[destroy setfalse settrue]
  before_action :admin_check

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.order(created_at: :desc)
      respond_to do |format|
      format.html
      format.csv do
        send_data(@bookings.to_csv, filename: 'bookings-#{Date.today}.csv')
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to admin_bookings_path, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def settrue
    @booking = Booking.find(params[:id])
    @booking.verified = true
    @booking.save
    respond_to do |format|
      format.html { redirect_to admin_bookings_path, notice: 'Booking was successfully verified.' }
    end
  end

  def setfalse
    @booking = Booking.find(params[:id])
    @booking.verified = false
    @booking.save
    respond_to do |format|
      format.html { redirect_to admin_bookings_path, notice: 'Booking was successfully verified.' }
    end
  end

  def admin_check
    redirect_to root_path, alert: 'You cant check this' unless current_user && current_user.admin?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:arrive, :departure, :room_id, :user_id)
  end
end
