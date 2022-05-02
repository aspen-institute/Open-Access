class AddBannerToPages < ActiveRecord::Migration[7.0]
  def change
    change_table :pages do |t|
      t.string :banner, null: true, default: ""
    end
  end
end
