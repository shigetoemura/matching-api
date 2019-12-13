class Match < ApplicationRecord
	has_one :chat, dependent: :destroy
    has_one :match_request


    validates :match_request_id, presence: true
end
