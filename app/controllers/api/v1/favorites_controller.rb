class Api::V1::FavoritesController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user

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

	private
	def set_user
		@user = User.find_by!(id: params[:id])
	end
end
