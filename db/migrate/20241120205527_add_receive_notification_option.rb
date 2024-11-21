class AddReceiveNotificationOption < ActiveRecord::Migration[8.0]
  def change
    add_column :dashboards, :track_notifications, :boolean, default: false
  end
end
