# frozen_string_literal: true

require 'rails_helper'
require 'rack/test'
require 'rspec/json_expectations'

RSpec.describe Api, type: :request do
  include Rack::Test::Methods

  describe 'GET /api/api' do
    it 'returns success response', :aggregate_failures do
      get '/api/health'
      expect(last_response.status).to eq(HttpStatus::OK)
      expect(last_response.body).to include_json(
        {
          health: 'ok'
        }
      )
    end
  end
end
