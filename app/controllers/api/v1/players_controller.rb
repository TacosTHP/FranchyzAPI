class Api::V1::PlayersController < ApplicationController
  before_action :authenticate_player!, only: [:update]
  before_action :set_player, only: [:show, :update, :destroy]

  def show
    @player
    @team = @player.team
    @attendances = @player.retrieve_attendances
  end

  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  private
  def set_player
    @player = Player.find(params[:id])
  end


  def player_params
    params.require(:player).permit(:first_name, :last_name, :email, :phone, :birthdate, :arrival, :availability?, :height, :weight, :gender, :jersey_number, :position, :team_id, :created_at, :updated_at)
  end
end
