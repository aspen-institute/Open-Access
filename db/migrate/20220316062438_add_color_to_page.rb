class AddColorToPage < ActiveRecord::Migration[7.0]
  def change
    change_table :pages do |t|
      t.string :color, null: false, default: "#0a4a7a"
    end
  end
end
