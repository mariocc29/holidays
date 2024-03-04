# frozen_string_literal: true

module V1
  # Version: 1
  # This class represents the API for handling endpoints.
  class HolidaysApi < Grape::API
    version 'v1', using: :path

    resource :holidays do
      desc 'Returns information about holidays.',
           is_array: true,
           success: Entities::HolidayEntity,
           failure: [
             ApplicationException::BadRequestException.to_h
           ]
      params do
        requires :code, type: String, values: Rules.codes, desc: 'The code for which you want holiday information'
        optional :locale, type: String, values: %w[en fr_CA], desc: 'The desired locale for holiday information.'
        optional :year, type: Integer, desc: 'The year for which you want holiday information.'
      end
      route_param :code do
        get do
          data = Core::Handler.get params[:code], params[:locale], params[:year]
          present data, with: Entities::HolidayEntity
        end
      end
    end
  end
end
