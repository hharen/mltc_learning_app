# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TextMaterial do
  fixtures :all

  let(:material) { materials(:text_material) }

  describe '#title' do
    it 'does not return any title' do
      expect(material.title).to be_nil
    end
  end
end
