# frozen_string_literal: true

class AddWhatStudentsLearnToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :what_students_learn, :string, array: true
  end
end
