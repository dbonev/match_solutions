class AddLinkAndDescriptionToSubcontractor < ActiveRecord::Migration
  def change
    add_column :subcontractors, :link, :string
    add_column :subcontractors, :description, :string
  end
end
