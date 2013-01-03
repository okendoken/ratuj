class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :card
      t.references :user

      t.timestamps
    end
    add_index :payments, :user_id
  end
end
