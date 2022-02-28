# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MaterialsController', type: :request do
  fixtures :all

  let(:admin) { users(:admin) }
  let(:topic) { topics(:introduction) }
  let(:lesson) { lessons(:introduction_lesson1) }

  before { sign_in admin }

  describe 'GET /topics/:id/lessons/:id/materials' do
    it 'has a :ok http status' do
      get "/topics/#{topic.id}/lessons/#{lesson.id}/materials"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /topics/:id/lessons/:id/materials/new' do
    it 'has a :ok http status' do
      get "/topics/#{topic.id}/lessons/#{lesson.id}/materials/new"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /topics/:id/lessons/:id/materials' do
    let(:params) do
      {
        material: { type: 'TextMaterial' }
      }
    end
  end
end
