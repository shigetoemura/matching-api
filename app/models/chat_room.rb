class ChatRoom < ApplicationRecord
	validates :user_id, :uniqueness => {:scope => :opponent_user_id}
    belongs_to :user, optional: true

	has_many :messages, dependent: :destroy
end
