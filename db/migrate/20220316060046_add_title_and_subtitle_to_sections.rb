class AddTitleAndSubtitleToSections < ActiveRecord::Migration[7.0]
  def change
    change_table :home_sections do |t|
      t.string :title, null: false, default: ""
      t.string :subtitle, null: true, default: ""
    end
  end
end
