class Api::V1::MatchesController < Api::V1::ApplicationController
	before_action :authorize!

	def index
		match_users = MatchRequest.where(status: 1).where('from_user_id = ? OR to_user_id = ?', current_user.id, current_user.id).page(params[:page]).per(params[:page]).order(updated_at: :desc)
        serializer = ActiveModel::Serializer::CollectionSerializer.new(
            match_users,
            serializer: Api::V1::MatchSerializer
        )
        render json: serializer.as_json
	end
end
