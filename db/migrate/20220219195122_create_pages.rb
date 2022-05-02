class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug, index: true
      t.json :content, null: false

      t.timestamps
    end

    # add_foreign_key :pages, :authors
  end
end
