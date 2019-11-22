class Api::V1::SignUpsController < Api::V1::ApplicationController
	protect_from_forgery :except => [:create]

	def create
		user = User.new(user_params)
		user.save!
		serializer = Api::V1::SignUpSerializer.new(user)
		render json: serializer.as_json
	end

	private
	def user_params
		params.require(:user_params).permit(
			:name,
			:gender)
	end
end
