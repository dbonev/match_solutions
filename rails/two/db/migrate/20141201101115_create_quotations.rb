class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.belongs_to :project, index: true
      t.datetime :created_at
      t.string :description

      t.timestamps
    end
  end
end
