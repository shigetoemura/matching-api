class ChatRoom < ApplicationRecord
	belongs_to :user
	belongs_to :opponent_user, class_name: 'User'
	has_many :messages
end
