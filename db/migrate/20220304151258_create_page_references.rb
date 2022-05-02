class CreatePageReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :page_references do |t|
      t.references :home_section, null: false, foreign_key: true
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
