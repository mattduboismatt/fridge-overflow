class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :visit_count
      t.references :user

      t.timestamps
    end
  end
end
