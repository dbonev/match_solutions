class CreateQlibriContacts < ActiveRecord::Migration
  def change
    create_table :qlibri_contacts do |t|
      t.string :name
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
