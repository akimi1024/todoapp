class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.references :board, null: false
      t.string :task_title, null: false
      t.text :task_content, null: false
      t.integer :status, default: 0
      t.integer :limit
      t.timestamps
    end
  end
end
