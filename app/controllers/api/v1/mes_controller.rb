class Api::V1::MesController < Api::V1::ApplicationController
	before_action :authorize!

	def show
		serializer = Api::V1::MeSerializer.new(current_user)
		render json: serializer.as_json
	end

	def update
		@user = current_user
		if params[:user_params][:name].present?
			@user.name = params[:user_params][:name]
		end
		if params[:user_params][:origin].present?
			@user.origin = params[:user_params][:origin]
		end
		if params[:user_params][:job].present?
			@user.job = params[:user_params][:job]
		end
		if params[:user_params][:intro].present?
			@user.intro = params[:user_params][:intro]
		end
		if params[:user_params][:height].present?
			@user.height = params[:user_params][:height]
		end
		if params[:user_params][:income].present?
			@user.income = params[:user_params][:income]
		end

		if @user.save
			serializer = Api::V1::MeSerializer.new(@user)
			render json: serializer.as_json
		else
			raise ActiveRecord::RecordNotSaved
		end

  	end

  	private

  	def user_params
    	params.require(:user_params).permit(
    		:name,
    		:origin,
    		:job,
    		:intro,
    		:height,
    		:income)
  	end

end
