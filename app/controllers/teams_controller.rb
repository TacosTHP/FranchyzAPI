class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]

  # GET /teams
  def index
    @teams = Team.where(club_id: params[:club_id])
  end

  # GET /teams/1
  def show
    @team
    @games = Game.get_team_games(@team)
    @practices = Practice.get_team_practices(@team)
    @club = @team.club
  end

  # POST /teams
  def create
    @team = Team.new(team_params)

    if @team.save
      render json: @team, status: :created
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:title, :coach_id, :creator_id, :club_id)
    end
end
