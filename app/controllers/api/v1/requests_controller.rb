class Api::V1::RequestsController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user, only: [:create, :skip, :show]

	def create
        UserRequest.create!(from_user_id: @user.id, to_user_id: current_user.id)

        render json: { message: "success" }
    end

    def index
        requests = current_user.requests.where(status: 0).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
        from_users = User.where(id: requests.map(&:from_user_id))
        render json: requests, each_serializer: Api::V1::RequestSerializer, from_users: from_users
    end

    private
    def set_user
        @user = User.find_by!(id: params[:id])
    end
end
