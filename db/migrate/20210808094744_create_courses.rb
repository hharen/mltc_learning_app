# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :completed, default: false
      t.string :ask_question_url

      t.timestamps
    end
  end
end
