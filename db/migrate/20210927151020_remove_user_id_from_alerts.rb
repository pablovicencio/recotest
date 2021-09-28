class RemoveUserIdFromAlerts < ActiveRecord::Migration[6.0]
  def change
    remove_column :alerts, :user_id, :integer
  end
end
