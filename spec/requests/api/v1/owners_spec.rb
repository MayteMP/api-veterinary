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
      post '/api/v1/owners', params: { owner: invalid_params }
      expect(response).to have_http_status(422)
    end
  end

  describe '#update' do
    let(:valid_update_params) do
      {
        id: Owner.first.id,
        owner: valid_params
      }
    end

    let(:invalid_update_params) do
      {
        id: Owner.first.id,
        owner: invalid_params
      }
    end

    let(:expect_response_bad_request) do
      {
        "error": "Couldn't find Owner with 'id'=1000"
      }
    end

    before { create(:owner) }

    it 'change the owner name and specie' do
      put "/api/v1/owners/#{Owner.first.id}", params: valid_update_params
      expect(response).to have_http_status(200)
    end

    it 'returns a 422 status when recive invalid params' do
      put "/api/v1/owners/#{Owner.first.id}", params: invalid_update_params
      expect(response).to have_http_status(422)
    end

    it 'return an error message when the record is not found' do
      put '/api/v1/owners/1000'
      response.body.should == expect_response_bad_request.to_json
    end
  end
end
