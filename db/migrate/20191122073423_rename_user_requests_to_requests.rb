class RenameUserRequestsToRequests < ActiveRecord::Migration[5.2]
  def change
  	rename_table :user_requests, :requests
  end
end
