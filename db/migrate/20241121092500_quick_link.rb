class QuickLink < ActiveRecord::Migration[8.0]
  def change
    create_table :quick_links do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.timestamps
    end
  end
end
