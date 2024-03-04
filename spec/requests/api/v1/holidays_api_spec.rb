# frozen_string_literal: true

require 'rails_helper'
require 'rack/test'

RSpec.describe V1::HolidaysApi, type: :request do
  include Rack::Test::Methods

  describe 'GET /api/v1/holidays_api' do
    it 'returns success response' do
      get '/api/v1/holidays/'
      expect(last_response.status).to eq(200)
    end
  end
end
