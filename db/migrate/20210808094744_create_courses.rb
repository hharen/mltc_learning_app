# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :description
      t.string :ask_question_link

      t.timestamps
    end
  end
end
