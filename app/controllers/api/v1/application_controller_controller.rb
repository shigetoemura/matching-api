class Api::V1::ApplicationControllerController < ApplicationController
	def authorize!
		return if current_user
		render json: { message: "You do not have right permission to view this resources" }, status: :unauthorized

	end

	def current_user
		User.where(token: bearer_token).first
	end

	private
	def bearer_token
		@bearer_token ||= begin
      pattern = /^Bearer /
      header = request.headers['Authorization']
      header.gsub(pattern, '') if header&.match(pattern)
    end
	end
end
