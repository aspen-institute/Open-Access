class AddUnlistedToPages < ActiveRecord::Migration[7.0]
  def change
    change_table :pages do |t|
      t.boolean :unlisted, null: false, default: false
    end
  end
end
