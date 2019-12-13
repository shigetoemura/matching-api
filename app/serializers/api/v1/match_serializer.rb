class Api::V1::MatchSerializer < ActiveModel::Serializer
  attributes :id,
             :from_user,
             :to_user,
             :created_at,
             :updated_at

  def from_user
      Api::V1::UserSerializer.new(object.user)
  end

  def to_user
      Api::V1::UserSerializer.new(object.user)
  end

  def created_at
    object.created_at.to_i
  end

  def updated_at
    object.updated_at.to_i
  end

end
