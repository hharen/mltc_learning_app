# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResourceMaterial do
  fixtures :all

  let(:material) { materials(:resource_material) }

  describe '#title' do
    it 'returns correct title' do
      expect(material.title).to eq('Resources')
    end
  end
end
