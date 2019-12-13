class Api::V1::ChatsController < Api::V1::ApplicationController
	before_action :set_match, only: [:create, :index]

    def index
        chats = Chat.where(match_id: params[:id]).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
		serializer = ActiveModel::Serializer::CollectionSerializer.new(
			chats,
			serializer: Api::V1::ChatSerializer,
		)
		render json: serializer.as_json
    end

    def create
        chat = Chat.create!(match_id: @match.id, user_id: current_user.id, text: chat_params)
        serializer = Api::V1::ChatSerializer.new(chat)
        render json: serializer.as_json
    end


    private

    def set_match
        @match = Match.find_by!(id: params[:id])
    end

    def chat_params
        params.require(:chat).permit(
            :text
        )
    end
end
