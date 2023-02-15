class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :hide_email, :boolean
    add_column :users, :linkedin_url, :string
    add_column :users, :github_url, :string
    add_column :users, :twitter_url, :string
  end
end
