class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :description
      t.timestamp :start_date
      t.timestamp :end_date
      t.references :resource, index: true

      t.timestamps
    end
  end
end
