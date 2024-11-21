class AddDashboardToDatabase < ActiveRecord::Migration[8.0]
  def change
    create_table :dashboards do |t|
      t.string :query
      t.integer :order
      t.timestamps
    end
  end
end
