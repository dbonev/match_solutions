class AddPasswordToSubcontractor < ActiveRecord::Migration
  def change
    add_column :subcontractors, :password, :string
  end
end
