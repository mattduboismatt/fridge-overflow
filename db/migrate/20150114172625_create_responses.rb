class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :content
      t.references :user
      t.references :responsive, polymorphic: true, index: true

      t.timestamps
    end
  end
end
