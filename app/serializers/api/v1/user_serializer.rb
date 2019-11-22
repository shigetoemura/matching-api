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
  			:created_at,
  			:updated_at

  	def created_at
  		object.created_at.to_i
  	end

  	def updated_at
  		object.updated_at.to_i
  	end
end
