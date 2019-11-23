class Api::V1::ChatRoomsController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user, only: [:create]

	def create
        chat_room = ChatRoom.create!(user_id: current_user.id, opponent_user_id: @user.id)
		render json: { message: "success" }
    end

	def index
		chat_rooms = current_user.chat_rooms.page(params[:page]).per(params[:limit]).order(updated_at: :desc)
        opponent_users = User.where(id: chat_rooms.map(&:opponent_user_id))
        serializer = ActiveModel::Serializer::CollectionSerializer.new(
        	chat_rooms,
        	serializer: Api::V1::ChatRoomSerializer,
        	current_user: current_user
        	)
        render json: serializer.as_json

	end

	private
	def set_user
		@user = User.find_by!(id: params[:id])
	end

end
