class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  def unconfirmed_events
    @events = Event.where("player_id = ?", params[:player_id]).where(confirmed?: false)
  end

  def my_attended_games
    @my_attended_games = Game.get_my_attended_games(params[:player_id])
  end

  def my_unattended_games
    @my_unattended_games = Game.get_my_unattended_games(params[:player_id])
  end

  def my_attended_practices
    @my_attended_practices = Practice.get_my_attended_practices(params[:player_id])
  end

  def my_unattended_practices
    @my_unattended_practices = Practice.get_my_unattended_practices(params[:player_id])
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:player_id, :game_id, :practice_id, :confirmed?)
    end
end
