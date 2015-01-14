class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :website
      t.string :location
      t.integer :age
      t.string :real_name
      t.binary :profile_picture

      t.timestamps
    end
  end
end
