class AddUserIdToSubcontractor < ActiveRecord::Migration
  def change
    add_column :subcontractors, :user_id, :int
  end
end
