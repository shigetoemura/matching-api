class Favorite < ApplicationRecord
	validates :user_id, :uniqueness => {:scope => :to_user_id}
	validates :favorable_type, presence: true
	validates :favorable_id, presence: true

	belongs_to :user
	belongs_to :favorable, polymorphic: true
end
