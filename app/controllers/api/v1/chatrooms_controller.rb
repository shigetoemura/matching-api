class Api::V1::ChatroomsController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user, only: [:create]

	def create
		chatroom = ChatRoom.new()
		chatroom.user_id = current_user.id
		chatroom.opponent_user_id = params[:user_id]
		if chatroom.save!
			render json: { message: "success" }
		else
			render json: { message: "error" }
		end
	end

	private
	def set_user
		@user = User.where(id: params[:id])
	end
end
