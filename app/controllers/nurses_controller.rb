class NursesController < ApplicationController

  def index
    @nurses = Nurse.all
    render json: @nurses, status: :ok
    rescue StandardError => e
      print e
  end

  def show
    @nurse = Nurse.find(params[:id])
    render json: @nurse, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.message
      }, status: :not_found
  end

end
