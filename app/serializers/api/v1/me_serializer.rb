class Api::V1::MeSerializer < ActiveModel::Serializer
  attributes :id,
            :image_url,
            :name,
            :birthday,
            :gender,
            :origin,
            :intro,
            :job,
            :height,
            :bio,
            :income,
            :created_at,
            :updated_at

    def image_url
      # image_url = UserImage.where(user_id: current_user.id)
      # serializer = Api::V1::UserImageSerializer.new(image_url)
    end

    def created_at
      object.created_at.to_i
    end

    def updated_at
      object.updated_at.to_i
    end
end
