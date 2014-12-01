class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :email
      t.string :description
      t.string :location
      t.datetime :created_at

      t.timestamps
    end
  end
end
