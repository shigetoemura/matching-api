class Api::V1::NotificationSerializer < ActiveModel::Serializer
  attributes :id,
            :from_user,
            :to_user,
            :notificable_type,
            :notificable,
            :created_at,
            :updated_at

    def initialize(object, option = {})
      @from_users = options[:from_users]
      super
    end

    def id
      object.id
    end

    def from_user
      from_user = @from_users.find { |t| t[:id] == object.from_user_id }
      Api::V1::UserSerializer.new(from_user)
    end

    def created_at
      object.created_at.to_i
    end

    def updated_at
      object.updated_at.to_i
    end
end
