class AddShowTextOnBannerToPages < ActiveRecord::Migration[7.0]
  def change
    change_table :pages do |t|
      t.boolean :show_text_on_banner, null: false, default: true
    end
  end
end
