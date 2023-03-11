class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.integer :staus, default: 0
      t.integer :limit
      t.timestamps
    end
  end
end
