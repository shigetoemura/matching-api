class Api::V1::FavoritesController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user, only: [:create, :destroy]

	def create
		Favorite.create!(favorable: @user, user_id: current_user.id, to_user_id: @user.id)
		serializer = Api::V1::UserSerializer.new(@user, current_user: current_user)
		render json: serializer.as_json
	end

	def destroy
		favorite = Favorite.find_by(user_id: current_user.id, to_user_id: @user.id)
		favorite.destroy!
		serializer = Api::V1::UserSerializer.new(@user, current_user: current_user)
		render json: serializer.as_json
	end

	def index
        favorites = current_user.favorites.page(params[:page]).per(params[:limit]).order(updated_at: :desc)
        to_users = User.where(id: favorites.map(&:to_user_id))

        render json: favorites, each_serializer: Api::V1::FavoriteSerializer, to_users: to_users
    end

	private
	def set_user
		@user = User.find_by!(id: params[:id])
	end
end
