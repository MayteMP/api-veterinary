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
      get '/api/v1/owners'
      expect(response.body).to match(expect_response.to_json)
    end
  end
end
