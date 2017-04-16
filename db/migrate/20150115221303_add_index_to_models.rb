class AddIndexToModels < ActiveRecord::Migration
  def change
    add_index :responses, [:user_id, :responsive_id]
    add_index :votes, [:user_id, :votable_id]
    add_index :questions, :user_id
    add_index :taggings, [:question_id, :tag_id]
    add_index :taggings, :tag_id
    add_index :answers, [:user_id, :question_id]
    add_index :answers, :question_id
  end
end
