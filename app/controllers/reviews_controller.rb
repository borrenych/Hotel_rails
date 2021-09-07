# Controller for reviews at app
class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit destroy]
  before_action :authenticate_user!, except: %i[show index home]

  # GET /reviews or /reviews.json
  def home
    @rooms = Room.all
  end

  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show; end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit; end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html do
          redirect_to @review,
                      notice: 'Review was successfully created. It will be added when administrator verifies it'
        end
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:title, :body, :verified, :name)
  end
end
