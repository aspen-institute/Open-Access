class CreateHomeSections < ActiveRecord::Migration[7.0]
  def change
    create_table :home_sections do |t|
      t.json :content
      t.integer :order, default: 0
      t.timestamps
    end
  end
end
