class NursesController < ApplicationController
  before_action :clean_params
  before_action :find_nurse_by_id, only: [:show, :update, :destroy]

  def index
    @nurses = Nurse.all
    render json: @nurses, status: :ok
  end

  def show
    render json: @nurse, status: :ok
  end

  def create
    if @nurse
      render json: @nurse, status: :conflict
    else
      @nurse = Nurse.new(permit_params)
      @nurse.role_id = process_role
      @nurse.save!
      render json: @nurse, status: :created
    end
  end

  def update
    @nurse.update!(permit_params)
    head :no_content
  end

  def destroy
    @nurse.destroy
    head :no_content
  end

  private

  def clean_params
    params[:first_name].downcase! if params[:first_name]
    params[:last_name].downcase! if params[:last_name]
  end

  def find_nurse_by_id
    @nurse = Nurse.find(params[:id])
  end

  def permit_params
    params.permit(:first_name, :last_name, :email, :role_id, :phone_number)
  end

  def process_role
    if Role.exists?(name: params[:role])
      role = Role.find(name: params[:role])['id']
    else
      role = Role.create!(name: params[:role])['id']
    end
  end

end
