class GamesController < ApplicationController
  before_action :authenticate_coach!, only: [:create, :update]
  # before_action :decode_token, only: [:create, :edit, :update, :delete]
  # before_action :check_admin, only: [:create, :edit, :update, :delete]
  before_action :set_game, only: [:show, :update, :destroy]
  before_action :set_team, only: [:index, :show, :update, :destroy]

  # GET /games
  def index
    @games = Game.get_team_games(@team)
  end

  # GET /games/1
  def show
    @game
    @teams = Team.get_game_teams(@game)
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

    def set_team
      @team = Team.find(params[:team_id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:title, :country, :zip_code, :starting_date_time, :duration, :home_team_score, :away_team_score, :canceled, :long_description, :address, :city)
    end
end
