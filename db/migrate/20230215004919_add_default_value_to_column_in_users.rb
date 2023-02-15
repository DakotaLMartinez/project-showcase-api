class AddDefaultValueToColumnInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :hide_email, :boolean, default: false
  end
end
