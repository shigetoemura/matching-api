class Api::V1::MatchRequestsController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user, only: [:create]
	before_action :set_request, only: [:accept, :skip]

	def create
		MatchRequest.create!(from_user_id: current_user.id, to_user_id: @user.id, status: 0)
		render json: { message: "success" }
	end

	def index
        requests = MatchRequest.where(to_user_id: current_user.id).where(status: 0).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
        request_users = User.where(id: requests.map(&:from_user_id))
        render json: requests, each_serializer: Api::V1::MatchRequestSerializer, request_users: request_users
    end

     def accept
        request = MatchRequest.where(status: 0).find_by!(id: @match_request.id)
        request.status = 1
        request.save!

        Match.create!(match_request_id: @match_request.id)
        render json: { messages: "matching"}
    end

    def skip
        request = MatchRequest.where(status: 0).find_by!(id: @match_request.id)
        request.status = 2
        request.save!
        render json: { messages: "skipped"}
    end

	private
    def set_user
        @user = User.find_by(id: params[:id])
    end

    def set_request
        @match_request = MatchRequest.find(params[:id])
    end
end
