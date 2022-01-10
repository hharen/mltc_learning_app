# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskMaterial do
  fixtures :all

  let(:material) { materials(:task_material) }

  describe '#title' do
    it 'returns correct title' do
      expect(material.title).to eq('Your tasks')
    end
  end
end
