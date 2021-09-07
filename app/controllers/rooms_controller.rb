# Controller for rooms
class RoomsController < ApplicationController
  before_action :set_room, only: %i[show]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @room = Room.find(params[:id])
    @booking = Booking.new
    @booking.room = @room
  end

  # GET /rooms/new

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.require(:room).permit(:title, :description, :body, :price, :image, attachments: [])
  end
end
