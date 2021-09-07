# App controller
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_handler
end

def record_not_found_handler
  respond_to do |format|
    format.json { render json: { msg: 'record not found', status: 404 }, status: :not_found }
    format.html { render html: 'Undefined route' }
  end
end
