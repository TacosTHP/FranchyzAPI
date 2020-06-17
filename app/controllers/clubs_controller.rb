class ClubsController < ApplicationController
  before_action :check_auth, only: [:create, :edit, :update, :delete]
  before_action :decode_token, only: [:create, :edit, :update, :delete]
  before_action :check_admin, only: [:create, :edit, :update, :delete]
  before_action :set_club, only: [:show, :update, :destroy]

  # GET /clubs
  def index
    @clubs = Club.all
  end

  # GET /clubs/1
  def show
    @club
    @players = Club.get_players(@club)
    @games = Club.get_games(@club)
    @practices = Club.get_practices(@club)
  end

  # POST /clubs
  def create
    @club = Club.new(club_params)

    if @club.save
      render json: @club, status: :created, location: @club
    else
      render json: @club.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clubs/1
  def update
    if @club.update(club_params)
      render json: @club
    else
      render json: @club.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clubs/1
  def destroy
    @club.destroy
    render json: "Resource destroyed"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def club_params
      params.require(:club).permit(:name, :address, :zip_code, :description, :city, :date_of_creation, :league, :conference, :pool)
    end
end
