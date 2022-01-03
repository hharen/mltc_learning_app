# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Lesson do
  fixtures :all

  let(:lesson1) { lessons(:introduction_lesson1) }
  let(:lesson2) { lessons(:introduction_lesson2) }

  describe '#previous' do
    context 'with a preceeding lesson' do
      it 'returns the previous lesson' do
        expect(lesson2.previous).to eq(lesson1)
      end
    end

    context 'when it is the first lesson' do
      it 'returns itself' do
        expect(lesson1.previous).to eq(lesson1)
      end
    end
  end

  describe '#next' do
    context 'with a following lesson' do
      it 'returns the next lesson' do
        expect(lesson1.next).to eq(lesson2)
      end
    end

    context 'when it is the first lesson' do
      it 'returns itself' do
        expect(lesson2.next).to eq(lesson2)
      end
    end
  end

  describe '#completed' do
    let(:subscription) { subscriptions(:subscription_anne_web_dev) }

    before do
      subscription.completed_lessons[lesson1.id] = true
      subscription.save!
    end

    it 'returns the completed status' do
      expect(lesson1.completed?(subscription)).to eq(true)
      expect(lesson2.completed?(subscription)).to eq(false)
    end
  end
end
