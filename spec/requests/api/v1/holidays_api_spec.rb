# frozen_string_literal: true

require 'rails_helper'
require 'rack/test'
require 'rspec/json_expectations'

RSpec.describe V1::HolidaysApi, type: :request do
  include Rack::Test::Methods

  describe 'GET /api/v1/holidays_api' do
    let(:code) { 'ca' }
    let(:params) { { locale: 'en', year: 2024 } }

    subject do
      get "/api/v1/holidays/#{code}", params
    end

    context 'when valid parameters are provided' do
      shared_examples 'valid parameters' do
        it 'returns holiday information with the correct structure', :aggregate_failures do
          response = subject
          expect(response.status).to eq(HttpStatus::OK)

          expect(response.body).to include_json(
            [{
              date: match(/\d{4}-\d{2}-\d{2}/),
              label: match(/.+/)
            }]
          )
        end
      end

      it_behaves_like 'valid parameters'

      context 'whit code "ca_qc"' do
        let(:code) { 'ca_qc' }

        it_behaves_like 'valid parameters'
      end

      context 'whit code "co"' do
        let(:code) { 'co' }

        it_behaves_like 'valid parameters'
      end
    end

    context 'with invalid parameters' do
      context 'when a invalid code has been provided' do
        let(:code) { 'invalid_code' }

        it 'returns a bad request error', :aggregate_failures do
          response = subject
          expect(response.status).to eq(HttpStatus::BAD_REQUEST)

          expected_error_response = {
            error: {
              code: HttpStatus::BAD_REQUEST,
              message: '[ERR003] - code does not have a valid value'
            }
          }

          expect(last_response.body).to include_json(expected_error_response)
        end
      end

      context 'when a invalid locale has been provided' do
        let(:params) { { locale: 'invalid_locale' } }

        it 'returns a bad request error', :aggregate_failures do
          response = subject
          expect(response.status).to eq(HttpStatus::BAD_REQUEST)

          expected_error_response = {
            error: {
              code: HttpStatus::BAD_REQUEST,
              message: '[ERR003] - locale does not have a valid value'
            }
          }

          expect(last_response.body).to include_json(expected_error_response)
        end
      end
    end
  end
end
