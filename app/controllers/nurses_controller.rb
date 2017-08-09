class NursesController < ApplicationController

  def index
    begin
      @nurses = Nurse.all
      render json: @nurses, status: :ok
    rescue StandardError => e
      print e
    end
  end

end
