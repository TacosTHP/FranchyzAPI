class Api::V1::PracticesController < ApplicationController
  before_action :set_practice, only: [:show, :update, :destroy]
  before_action :authenticate_coach!, only: [:create, :update]

  # GET /practices
  def index
    @practices = Practice.all
    render json: @practices
  end

  # GET /practices/1
  def show
    @practice
    @players = @practice.players
  end

  # POST /practices
  def create
    @practice = Practice.new(practice_params)
    if @practice.save
      render json: @practice, status: :created
    else
      render json: @practice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /practices/1
  def update
    if @practice.update(practice_params)
      render json: @practice
    else
      render json: @practice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /practices/1
  def destroy
    @practice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice
      @practice = Practice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def practice_params
      params.require(:practice).permit(:duration, :address, :zip_code, :city, :title, :long_description, :country, :starting_date_time, :canceled)
    end
end
