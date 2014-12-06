class RemovePasswordFromSubcontractor < ActiveRecord::Migration
  def change
    remove_column :subcontractors, :password, :string
  end
end
