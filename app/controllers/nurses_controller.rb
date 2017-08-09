class NursesController < ApplicationController

  def index
    @nurses = Nurse.all
    render json: @nurses, status: :ok
  end

  def show
    @nurse = Nurse.find(params[:id])
    render json: @nurse, status: :ok
  end

  def create
    @nurse = Nurse.new(permit_params)
    @nurse.role_id = process_role
    @nurse.save!
    render json: @nurse, status: :created
  end

  private

  def permit_params
    params.permit(:first_name, :last_name, :email, :role_id, :phone_number)
  end

  def process_role
    if (Role.exists?(name: params[:role]))
      role = Role.find(name: params[:role])['id']
    else
      role = Role.create!(name: params[:role])['id']
    end
  end

end
