class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :text
      t.integer :user_id
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
