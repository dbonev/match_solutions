class AddAllowRemoteToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :allow_remote, :boolean
  end
end
