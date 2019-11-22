class Api::V1::MesController < Api::V1::ApplicationController
	before_action :authorize!

	def show
		serializer = Api::V1::MeSerializer.new(current_user)
		render json: serializer.as_json
	end
end
