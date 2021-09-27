# Controller for Reviews at admin interface
class Admin::ReviewsController < ApplicationController
  before_action :set_review, only: %i[show destroy]
  before_action :admin_check

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
    @verified_reviews = @reviews.where(verified: true)
    @not_verified_reviews = @reviews.where(verified: nil)
  end

  # GET /reviews/1 or /reviews/1.json
  def show; end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to admin_reviews_path, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    @review = Review.find(params[:id])
    @review.verified = true
    @review.save
    respond_to do |format|
      format.html { redirect_to admin_reviews_path, notice: 'Review was successfully verified.' }
    end
  end

  def admin_check
    redirect_to reviews_path, alert: 'You cant check this' unless current_user && current_user.admin?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:title, :body, :verified)
  end
end
