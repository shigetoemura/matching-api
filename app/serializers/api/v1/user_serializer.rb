class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id,
  			:name,
  			:gender,
  			:origin,
  			:birthday,
  			:intro,
  			:job,
  			:income,
  			:height,
  			:bio,
  			:is_favorite,
        :token,
  			:created_at,
  			:updated_at

  	def created_at
  		object.created_at.to_i
  	end

  	def updated_at
  		object.updated_at.to_i
  	end

  	def is_favorite
      if instance_options[:current_user].present?
        instance_options[:current_user].favorites.where(to_user_id: object).present?
      else
        false
      end
    end
end
