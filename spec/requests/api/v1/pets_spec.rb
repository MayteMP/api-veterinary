# frozen_literal_string: true
require 'rails_helper'

RSpec.describe('Api::V1::Pets', type: :request) do
  describe '#index' do
    let(:expect_response) { Pet.all }

    before { create(:pet) }

    it 'load all register pets on json format' do
      get '/api/v1/pets'
      response.body.should == expect_response.to_json
    end
  end
end
