class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :about
      t.string :live_demo_url
      t.string :code_url
      t.string :video_url
      t.string :technologies, array: true, default: []
      t.string :collaborators, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
