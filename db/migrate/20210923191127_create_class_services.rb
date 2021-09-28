class CreateClassServices < ActiveRecord::Migration[6.0]
  def change
    create_table :class_services do |t|
      t.string :title
      t.integer :enable

      t.timestamps
    end
  end
end
