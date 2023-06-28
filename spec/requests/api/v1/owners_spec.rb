# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Api::V1::Owners', type: :request) do
  include_context :owners

  describe '#index' do
    let(:expect_response) do
      [owner_object]
    end

    before do
      create(:owner)
      get '/api/v1/owners'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'load all register owners on json format' do
      expect(response.body).to match(expect_response.to_json)
    end
  end

  describe '#show' do
    let(:expect_response) do
      owner_object
    end

    before { create(:owner) }

    context 'successfull response' do
      before { get "/api/v1/owners/#{Owner.first.id}" }

      it 'returns http success response' do
        expect(response).to have_http_status(:success)
      end

      it 'return specific data from register owner' do
        expect(response.body).to match(expect_response.to_json)
      end
    end

    context 'when the owner is not found' do
      it 'return http bad request' do
        get '/api/v1/owners/10000'
        expect(response).to have_http_status(400)
      end
    end
  end

  describe '#new' do
    it 'return a status 200 and owners has one record' do
      post '/api/v1/owners', params: { owner: valid_params }
      expect(Owner.count).to eq(1)
      expect(response).to have_http_status(200)
    end

    it 'return a 422 status when the params is invalid' do
      post '/api/v1/owners', params: { owner: valid_params }
      expect(response).to have_http_status(422)
    end
  end
end
