class AddFieldsToPages < ActiveRecord::Migration[7.0]
  def up
    change_table :pages do |t|
      t.references :page, index: true, foreign_key: true
      t.integer :order, default: 0
      t.string :status, default: "draft"
      t.string :path, null: false, default: "/"
      t.string :subtitle, null: false, default: ""
    end
  end

  def down
    remove_column :pages, :page_id
    remove_column :pages, :order
    remove_column :pages, :status
    remove_column :pages, :path
    remove_column :pages, :subtitle
  end
end
