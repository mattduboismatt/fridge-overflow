class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote_value
      t.references :votable, polymorphic: true, index: true
      t.references :user

      t.timestamps
    end
  end
end
