class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :problem
      t.text :body

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :problem_id
  end
end
