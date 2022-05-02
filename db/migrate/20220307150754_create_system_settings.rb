class CreateSystemSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :system_settings do |t|
      t.string :name, null: false
      t.string :value, null: false, default: ""
      t.timestamps
    end
  end
end
