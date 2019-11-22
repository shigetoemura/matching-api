class Api::V1::UsersController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user, except: [:search, :men, :women]

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

	def men
		if current_user.id = User.where(gender: 2)
			query = User.where(gender: 1).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
	        serializer = ActiveModel::Serializer::CollectionSerializer.new(
				query,
				serializer: Api::V1::UserSerializer,
				current_user: current_user
			)
			render json: serializer.as_json
		else
			render json: { message: "error" },status: 400
		end
	end

	def women
		if current_user.id = User.where(gender: 1)
			query = User.where(gender: 2).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
	        serializer = ActiveModel::Serializer::CollectionSerializer.new(
				query,
				serializer: Api::V1::UserSerializer,
				current_user: current_user
			)
			render json: serializer.as_json
		else
			render json: { message: "error" },status: 400
		end
	end

	def show
		Api::V1::UserSerializer.new(@user)
		render json: serializer.as_json
	end
end
