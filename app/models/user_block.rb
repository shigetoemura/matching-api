class UserBlock < ApplicationRecord
	validates :user_id, :uniqueness => {:scope => :blocking_user_id}
    belongs_to :user
end
