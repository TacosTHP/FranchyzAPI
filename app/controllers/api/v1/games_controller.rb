class Api::V1::GamesController < ApplicationController
  before_action :authenticate_coach!, only: [:create, :update]
  # before_action :decode_token, only: [:create, :edit, :update, :delete]
  # before_action :check_admin, only: [:create, :edit, :update, :delete]
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = @team.retrieve_games
  end

  # GET /games/1
  def show
    @game
    @teams = @game.retrieve_teams
  end

  # POST /games
  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end



  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:title, :country, :zip_code, :starting_date_time, :duration, :home_team_score, :away_team_score, :canceled, :long_description, :address, :city)
    end
end
