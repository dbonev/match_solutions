class CreateSubcontractors < ActiveRecord::Migration
  def change
    create_table :subcontractors do |t|
      t.string :name
      t.string :email
      t.string :skills
      t.string :company_size
      t.datetime :created_at
      t.string :location

      t.timestamps
    end
  end
end
