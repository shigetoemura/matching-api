class Api::V1::NotificationsController < Api::V1::ApplicationController
    before_action :authorize!

    def index
        notifications = current_user.notifications.page(params[:page]).per(params[:limit]).order(updated_at: :desc)

        from_user = User.where(id: notificatins.map(&:from_user_id))

        render json: notifications, each_serializer: Api::V1::NotificationSerializer, from_user: from_user

    end
end
