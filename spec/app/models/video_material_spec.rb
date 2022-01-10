# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VideoMaterial do
  fixtures :all

  let(:material) { materials(:video_material) }

  describe '#title' do
    it 'returns correct title' do
      expect(material.title).to eq('Video')
    end
  end

  describe '#show_body' do
    expected_body = "<video controls width='600'>
      <source src='video_link.mp4' type='video/mp4'>
      <source src='video_link.mov' type='video/mov'>
      <p>Your browser doesn\'t support HTML5 video. Here is a <a href='video_link.mp4'>link to the video</a> instead.</p>
    </video>"
    context 'with correct material type' do
      it 'returns the body' do
        expect(material.show_body).to eq(expected_body)
      end
    end
  end
end
