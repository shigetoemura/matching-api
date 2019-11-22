class Message < ApplicationRecord
	validates :user_id, presence: true
	validates :chat_room_id, presence: true

	belongs_to :chat_room
end
