class PlayersController < ApplicationController
	before_action :check_auth, only: [:show, :create, :edit, :update, :delete]
	before_action :decode_token, only: [:create, :edit, :update, :delete]

	def show
		@player = Player.find(params[:id])
		render json: @player
	end
end
