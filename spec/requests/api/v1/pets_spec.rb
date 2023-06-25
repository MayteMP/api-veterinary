# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Api::V1::Pets', type: :request) do
  describe '#index' do
    let(:expect_response) do
      [
        {
          "id": Pet.first.id,
          "name": 'Puppy',
          "birth_date": '2022-03-26',
          "color": 'Brown',
          "gengre": 'Male',
          "specie": 'Dog',
          "brees": 'Husky',
          "microchip_number": '1029384567',
          "particular_signs": 'Crazy Dog'
        }
      ]
    end

    before { create(:pet) }

    it 'load all register pets on json format' do
      get '/api/v1/pets'
      response.body.should == expect_response.to_json
    end
  end

  describe '#show' do
    let(:expect_response) do
      {
        "id": Pet.first.id,
        "name": 'Puppy',
        "birth_date": '2022-03-26',
        "color": 'Brown',
        "gengre": 'Male',
        "specie": 'Dog',
        "brees": 'Husky',
        "microchip_number": '1029384567',
        "particular_signs": 'Crazy Dog'
      }
    end

    let(:expect_response_bad_request) do
      {
        "error": "Couldn't find Pet with 'id'=1000"
      }
    end

    before { create(:pet) }

    it 'return a specific register from a register pet' do
      get "/api/v1/pets/#{Pet.first.id}"
      response.body.should == expect_response.to_json
    end

    it 'return an error message when the record is not found' do
      get '/api/v1/pets/1000'
      response.body.should == expect_response_bad_request.to_json
    end
  end

  describe '#update' do
    let(:valid_params) do
      {
        id: Pet.first.id,
        pet: {
          name: 'Joe Doe',
          specie: 'Cat'
        }
      }
    end

    let(:invalid_params) do
      {
        id: Pet.first.id,
        pet: {
          name: '',
          specie: nil
        }
      }
    end

    let(:expect_response_bad_request) do
      {
        "error": "Couldn't find Pet with 'id'=1000"
      }
    end

    before { create(:pet) }

    it 'change the pet name and specie' do
      put "/api/v1/pets/#{Pet.first.id}", params: valid_params
      expect(Pet.first.name).to eq('Joe Doe')
      expect(Pet.first.specie).to eq('Cat')
      expect(response).to have_http_status(200)
    end

    it 'returns a 422 status when recive invalid params' do
      put "/api/v1/pets/#{Pet.first.id}", params: invalid_params
      expect(response).to have_http_status(422)
    end

    it 'return an error message when the record is not found' do
      put '/api/v1/pets/1000'
      response.body.should == expect_response_bad_request.to_json
    end
  end

  describe '#new' do
    let(:pet) do
      {
        "name": 'Puppy',
        "birth_date": '2022-03-26',
        "color": 'Brown',
        "gengre": 'Male',
        "specie": 'Dog',
        "brees": 'Husky',
        "microchip_number": '1029384567',
        "particular_signs": 'Crazy Dog'
      }
    end

    it 'return a status 200 and pets has one record' do
      post '/api/v1/pets', params: { pet: pet }
      expect(Pet.count).to eq(1)
      expect(response).to have_http_status(200)
    end

    it 'return a 422 status when the params is invalid' do
      pet['name'] = ''
      post '/api/v1/pets', params: { pet: pet }
      expect(response).to have_http_status(422)
    end
  end
end
