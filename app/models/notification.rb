class Notification < ApplicationRecord
	belongs_to :notificable, polymorphic: true, optional: true
end
