class CreateNavigationLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :navigation_links do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
