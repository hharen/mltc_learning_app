# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reorderer do
  fixtures :all

  let(:lesson1) { lessons(:introduction_lesson1) }
  let(:lesson2) { lessons(:introduction_lesson2) }
  let(:lesson3) { lessons(:introduction_lesson3) }
  let(:lesson4) { lessons(:introduction_lesson4) }
  let(:last_lesson5) { lessons(:last_lesson5) }

  describe '#reorder!' do
    context 'when creating a new lesson without order' do
      let!(:new_lesson) { Lesson.create(name: 'New Lesson', topic: topics(:introduction)) }

      it 'orders a new lesson as the last one' do
        expect(new_lesson.order).to eq(Lesson.where(topic_id: new_lesson.topic.id).count)
      end
    end

    context 'when creating a new lesson with too high order' do
      let(:new_lesson_with_order) { Lesson.create(name: 'New Lesson with Order', topic: topics(:introduction), order: 9) }

      it 'orders a new lesson with a set order correctly' do
        expect(new_lesson_with_order.order).to eq(6)
      end
    end

    context 'when reordering an existing lesson' do
      it 'reorders a lesson to first position correctly' do
        lesson2.order = 1
        lesson2.save!

        expect(lesson1.order).to eq(2)
        expect(lesson2.order).to eq(1)
      end

      it 'reorders a lesson to next position correctly' do
        lesson1.order = 2
        lesson1.save!

        expect(lesson1.order).to eq(2)
        expect(lesson2.order).to eq(1)
      end

      it 'reorders a lesson with invalid order correctly' do
        lesson4.order = 7
        lesson4.save!

        expect(lesson4.order).to eq(5)
      end
    end
  end
end
