# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MaterialsController', type: :request do
  fixtures :all

  let(:admin) { users(:admin) }
  let(:topic) { topics(:introduction) }
  let(:lesson) { lessons(:introduction_lesson1) }

  before { sign_in admin }

  # new
  describe 'new - GET /topics/:id/lessons/:id/materials/new' do
    xit 'has a :ok http status' do
      get "/topics/#{topic.id}/lessons/#{lesson.id}/materials/new"
      expect(response).to have_http_status(:ok)
    end
  end

  # create
  describe 'create - POST /topics/:id/lessons/:id/materials' do
    let(:params) do
      {
        material: { type: 'TextMaterial', order: 1, body: 'Some text', lesson_id: lesson.id }
      }
    end

    xit 'creates a material' do
      expect do
        post "/topics/#{topic.id}/lessons/#{lesson.id}/materials/", params: params
      end.to change(Material, :count).by(1)
      expect(response).to have_http_status(:found)
    end
  end

  # edit
  describe 'edit - GET /topics/:id/lessons/:id/materials/:id/edit' do
    let(:material) { materials(:presentation_material) }

    xit 'returns ok' do
      get "/topics/#{topic.id}/lessons/#{lesson.id}/materials/#{material.id}/edit"

      expect(response).to have_http_status(:ok)
    end
  end

  # update
  describe 'update - POST /topics/:id/lessons/:id/materials/:id' do
    let(:material) { materials(:task_material) }
    let(:params) do
      {
        material: { order: 5, body: 'Some updated text' }
      }
    end

    xit 'returns ok' do
      patch "/topics/#{topic.id}/lessons/#{lesson.id}/materials/#{material.id}", params: params
      material.reload

      expect(material.body).to eq('Some updated text')
      expect(response).to have_http_status(:found)
    end
  end

  # destroy
  describe 'destroy - DELETE /topics/:id/lessons/:id/materials/:id' do
    let(:material) { materials(:resource_material) }

    xit 'returns ok' do
      expect do
        delete "/topics/#{topic.id}/lessons/#{lesson.id}/materials/#{material.id}"
      end.to change(Material, :count).by(-1)

      expect(response).to have_http_status(:found)
    end
  end
end

# TODO: Add unhappy paths
