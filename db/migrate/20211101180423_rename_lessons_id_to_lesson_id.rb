class RenameLessonsIdToLessonId < ActiveRecord::Migration[6.1]
  change_table :materials do |t|
    t.rename :lessons_id, :lesson_id
  end
end
