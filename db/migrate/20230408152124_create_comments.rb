class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.references :task, null: false
      t.text :comment_content, null:false 
      t.timestamps
    end
  end
end
