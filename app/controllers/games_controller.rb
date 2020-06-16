class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  # GET /games
  def index
    @games = Game.all
    # render json: @games
  end

  # GET /games/1
  def show
    @game
  #  render json: @game
  end

    # GET /mygames
    # def mygames
    
    #   id = @decoded_token[0]['sub']
    #   type = @decoded_token[0]['scp']
    #   @my_games = Game.get_my_games(id, type)
    #   render json: @my_games
    # end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
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
      params.require(:game).permit(:title, :description, :street, :street_number, :country, :zip_code, :starting_date_time, :duration, :home_team_score, :away_team_score, :canceled)
    end
end
