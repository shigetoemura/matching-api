class UserReport < ApplicationRecord
	validates :user_id, presence: true
    validates :report_user_id, presence: true

    belongs_to :user
end
