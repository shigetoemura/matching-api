class Api::V1::RequestSerializer < ActiveModel::Serializer
  attributes :id,
            :from_user,
            :to_user_id,
            :created_at,
            :updated_at

  def initialize(object, options = {})
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

end
