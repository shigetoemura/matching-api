class Api::V1::ChatSerializer < ActiveModel::Serializer
  attributes :id,
             :match_id,
             :user_id,
             :text,
             :created_at,
             :updated_at

  def created_at
    object.created_at.to_i
  end

  def updated_at
    object.updated_at.to_i
  end
end
