class AddDescriptionToPages < ActiveRecord::Migration[7.0]
  def change
    change_table :pages do |t|
      t.string :description, null:false, default: ""
    end
  end
end
