class CoachesController < ApplicationController

  before_action :check_auth, only: [:show, :create, :edit, :update, :delete]
  before_action :decode_token, only: [:create, :edit, :update, :delete]
  before_action :check_admin, only: [:create, :edit, :update, :delete]

  def show
    @coach = Coach.find(params[:id]) 
    render json: @coach
  end

end
