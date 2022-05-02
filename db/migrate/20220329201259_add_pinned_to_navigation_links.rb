class AddPinnedToNavigationLinks < ActiveRecord::Migration[7.0]
  def change
    change_table :navigation_links do |t|
      t.boolean :pinned, null: false, default: false
    end
  end
end
