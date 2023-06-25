# frozen_literal_string: true
require 'rails_helper'

RSpec.describe('Api::V1::Pets', type: :request) do
  describe '#index' do
    let(:expect_response) {
      [
        {"id":Pet.first.id,
         "name":"Puppy",
         "birth_date":"2022-03-26",
         "color":"Brown",
         "gengre":"Male",
         "specie":"Dog",
         "brees":"Husky",
         "microcip_number":"1029384567",
         "particular_signs":"Crazy Dog"
         }
      ]
     }

    before { create(:pet) }

    it 'load all register pets on json format' do
      get '/api/v1/pets'
      response.body.should == expect_response.to_json
    end
  end

  describe "#show" do
    let(:expect_response) {
      {
        "id":Pet.first.id,
        "name":"Puppy",
        "birth_date":"2022-03-26",
        "color":"Brown",
        "gengre":"Male",
        "specie":"Dog",
        "brees":"Husky",
        "microcip_number":"1029384567",
        "particular_signs":"Crazy Dog"
      }
    }
    let(:expect_response_bad_request) {
      {
        "error": "Couldn't find Pet with 'id'=1000"
      }
    }

    before { create(:pet) }

    it 'return a specific register from a register pet' do
      get "/api/v1/pets/#{Pet.first.id}"
      response.body.should == expect_response.to_json
    end

    it 'return a specific register from a register pet' do
      get "/api/v1/pets/1000"
      response.body.should == expect_response_bad_request.to_json
    end
  end
end
