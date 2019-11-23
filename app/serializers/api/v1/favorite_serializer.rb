class Api::V1::FavoriteSerializer < ActiveModel::Serializer
  attributes :id,
            :user_id,
            :to_user,
            :created_at,
            :updated_at,

  def initialize(object, options = {})
    @to_users = options[:to_users]
    super
  end

  def id
    object.id
  end

  def to_user
    to_user = @to_users.find { |t| t[:id] == object.to_user_id }
    Api::V1::UserSerializer.new(to_user)
  end

  def created_at
    object.created_at.to_i
  end

  def updated_at
    object.updated_at.to_i
  end
end
