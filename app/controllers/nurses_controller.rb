class NursesController < ApplicationController
  before_action :clean_params, only: [:create, :update]
  before_action :find_nurse, only: [:show, :create, :update, :destroy]

  def index
    @nurses = Nurse.all
    render json: @nurses, status: :ok
  end

  def show
    render json: @nurse, status: :ok
  end

  def create
    @nurse = Nurse.new(permit_params)
    @nurse.role_id = process_role
    @nurse.save!
    render json: @nurse, status: :created
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
    params[:role].downcase! if params[:role]
    params[:phone_number].gsub!(/[^0-9]/, "") if params[:phone_number]
  end

  def find_nurse
    if params[:first_name] && params[:last_name]
      @nurse = Nurse.find_by(first_name: params[:first_name], last_name: params[:last_name])
    elsif params[:id]
      @nurse = Nurse.find(params[:id])
    end
  end

  def permit_params
    params.permit(:first_name, :last_name, :email, :role_id, :phone_number)
  end

  def process_role
    role = Role.find_or_create_by!(name: params[:role])['id']
  end
end
