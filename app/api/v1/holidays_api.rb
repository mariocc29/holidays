# frozen_string_literal: true

module V1
  # Version: 1
  # This class represents the API for handling endpoints.
  class HolidaysApi < Grape::API
    version 'v1', using: :path

    resource :holidays do
      desc 'Returns information about holidays.',
           is_array: true
      get do
        { test: true }
      end
    end
  end
end
