class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.string :description
      t.string :content
      t.integer :order, null: false
      t.references :topics, foreign_key: true

      t.timestamps
    end
  end
end
