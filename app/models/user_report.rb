class UserReport < ApplicationRecord
	validates :user_id, :uniqueness => {:scope => :report_user_id}

    belongs_to :user
end
