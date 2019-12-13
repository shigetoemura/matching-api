class Api::V1::SignUpSerializer < ActiveModel::Serializer
  attributes :id,
  			:name,
  			:gender,
  			:birthday,
  			:origin,
  			:intro,
  			:job,
  			:income,
  			:height,
  			:bio,
  			:token,
  			:created_at,
  			:updated_at

  	def created_at
  		object.created_at.to_i
  	end

  	def updated_at
  		object.created_at.to_i
  	end
end
