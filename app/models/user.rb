class User < ApplicationRecord
	validates :name, presence: true
	validates :gender, presence: true
	validates :bio, presence: true

	has_many :favorites, dependent: :destroy
	has_many :user_images, dependent: :destroy

    has_many :match_requests, foreign_key: "from_user_id", dependent: :destroy
    has_many :match_requests, foreign_key: "to_user_id", dependent: :destroy


	before_validation :assign_token

	def assign_token
		self.token ||= SecureRandom.uuid
	end
end
