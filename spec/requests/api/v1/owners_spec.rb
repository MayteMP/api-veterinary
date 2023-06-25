# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Api::V1::Owners', type: :request) do
  describe '#index' do
    let(:expect_response) do
      [
        {
          "id": Owner.first.id
        }
      ]
    end

    before { create(:owner) }

    it 'load all register owners on json format' do
      get '/api/v1/owner'
      response.body.should == expect_response.to_json
    end
  end
end
