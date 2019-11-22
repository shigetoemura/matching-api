class Api::V1::NotificationsController < Api::V1::ApplicationController
    before_action :authorize!

    def index
    	notifications = Notification.where(to_user_id: current_user.id).page(params[:page]).per(params[:limit]).order(updated_at: :desc)
        serializer = ActiveModel::Serializer::CollectionSerializer.new(
        	notifications,
        	serializer: Api::V1::NotificationSerializer
        	)
        render json: serializer.as_json
    end
end
