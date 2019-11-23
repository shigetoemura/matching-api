class Api::V1::ChatRoomsController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user, only: [:create, :destroy]

	def create
        ChatRoom.create!(user_id: current_user.id, opponent_user_id: @user.id)
		serializer = Api::V1::UserSerializer.new(@user, current_user: current_user)
		render json: serializer.as_json
    end

    def destroy
		chat_room = ChatRoom.find_by(user_id: current_user.id, opponent_user_id: @user.id)
		chat_room.destroy!
		serializer = Api::V1::UserSerializer.new(@user, current_user: current_user)
		render json: serializer.as_json
	end

	def index
		chat_rooms = current_user.chat_rooms.page(params[:page]).per(params[:limit]).order(updated_at: :desc)
        opponent_users = User.where(id: chat_rooms.map(&:opponent_user_id))
        render json: chat_rooms, each_serializer: Api::V1::ChatRoomSerializer, opponent_users: opponent_users
	end

	private
	def set_user
		@user = User.find_by!(id: params[:id])
	end

end
