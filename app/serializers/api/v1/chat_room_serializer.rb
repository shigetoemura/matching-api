class Api::V1::ChatRoomSerializer < ActiveModel::Serializer
  attributes :id,
  			:user_id,
  			:opponent_user,
            :created_at,
            :updated_at

    def initialize(object, options = {})
      @opponent_users = options[:opponent_users]
      super
    end

    def id
      object.id
    end

    def opponent_user
      opponent_user = @opponent_users.find { |t| t[:id] == object.opponent_user_id }
      Api::V1::UserSerializer.new(opponent_user)
    end

    def created_at
      object.created_at.to_i
    end

    def updated_at
      object.updated_at.to_i
    end
end
