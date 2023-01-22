# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PresentationMaterial do
  fixtures :all

  let(:material) { materials(:presentation_material) }

  describe '#title' do
    it 'returns correct title' do
      expect(material.title).to eq('Presentation')
    end
  end

  describe '#show_body' do
    expected_body = "<iframe src='presentation_link/embed?start=false&loop=false&delayms=3000' class='presentation'     frameborder='0' allowfullscreen='true' mozallowfullscreen='true' webkitallowfullscreen='true'></iframe>"
    context 'with correct material type' do
      it 'returns the body' do
        puts material.show_body
        expect(material.show_body).to eq(expected_body)
      end
    end
  end
end
