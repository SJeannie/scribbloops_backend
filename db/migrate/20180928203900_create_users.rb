class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :type
      t.boolean :isOnline
      t.boolean :isWriter
      t.boolean :isAdmin
      t.boolean :isAdvisor
      t.float :writer_rating
      t.float :advisor_rating

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
  end
end
