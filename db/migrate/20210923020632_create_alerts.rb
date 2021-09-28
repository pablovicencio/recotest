class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.string :name_alert
      t.string :from_alert
      t.string :to_alert
      t.integer :class_alert
      t.integer :price_alert
      t.integer :user_id

      t.timestamps
    end
  end
end
