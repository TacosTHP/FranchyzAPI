class PlayersController < ApplicationController
	before_action :set_player, only: [:show, :update, :destroy]
	before_action :check_auth, only: [:show, :create, :edit, :update, :delete]
	before_action :decode_token, only: [:create, :edit, :update, :delete]

	def show
		@player = Player.find(params[:id])
		render json: @player
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
		params.require(:player).permit(:first_name, :last_name, :phone_number)
	end
end
