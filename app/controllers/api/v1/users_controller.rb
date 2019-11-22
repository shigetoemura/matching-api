class Api::V1::UsersController < Api::V1::ApplicationController
	before_action :authorize!

	def search
		query = User.all
		if params[:query].present?
			query = query.where("origin like '%" + params[:query] + "%'")
			.where("job like '%" + params[:query] + "%'")
			.where("income like '%" + params[:query] + "%'")
			.where("height like '%" + params[:query] + "%'")
			.where("birthday like '%" + params[:query] + "%'")
			.uniq
			.page(params[:page])
			.per(params[:limit])
			.order(updated_at: :desc)
		else
			query = query.page(params[:page]).per(params[:limit]).order(updated_at: :desc)
		end
		serializer = ActiveModel::Serializer::CollectionSerializer.new(
			query,
			serializer: Api::V1::UserSerializer,
			current_user: current_user
			)
		render json: serializer.as_json
	end
end
