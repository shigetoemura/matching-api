class Request < ApplicationRecord
	validates :from_user_id, presence: true
    validates :to_user_id, presence: true
    validates :to_user_id, :uniqueness => {:scope => :from_user_id}

    belongs_to :user, foreign_key: "from_user_id"
    belongs_to :user, foreign_key: "to_user_id"

    has_many :notifications, as: :notificable
end
