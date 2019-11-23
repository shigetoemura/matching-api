class Api::V1::ChatroomsController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user, only: [:create]

	def create
		ChatRoom.create!(user_id: current_user.id, opponent_user_id: @user.id)
		render json: { message: "success" }
	end

	private
	def set_user
		@user = User.where(id: params[:id])
	end
end
