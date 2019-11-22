class Api::V1::UsersController < Api::V1::ApplicationController
	before_action :authorize!
	before_action :set_user, except: [:search, :gender]

	def search
		query = User.where.not(id: current_user.id)
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

	def gender
		if current_user.gender == 2
			mens = User.where.not(id: current_user.id, gender: 2).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
			serializer = ActiveModel::Serializer::CollectionSerializer.new(
					mens,
					serializer: Api::V1::UserSerializer,
					current_user: current_user
				)
			render json: serializer.as_json
		elsif current_user.gender != 2
			womens = User.where.not(id: current_user.id, gender: 1).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
			serializer = ActiveModel::Serializer::CollectionSerializer.new(
					womens,
					serializer: Api::V1::UserSerializer,
					current_user: current_user
				)
			render json: serializer.as_json
		else
			render json: { message: "error" },status: 400
		end
	end

	def show
		serializer = Api::V1::UserSerializer.new(@user)
		render json: serializer.as_json
	end

	def report
		UserReport.create!(user_id: current_user.id, report_user_id: @user.id)
		render json: { message: "success" }
	end

	def blocking
		UserBlock.create!(user_id: current_user.id, blocking_user_id: @user.id)
		render json: { message: "success" }
	end

	private
	def set_user
		@user = User.find_by!(id: params[:id])
	end
end
