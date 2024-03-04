# frozen_string_literal: true

# This class represents the main API combining multiple versions.
class Api < Grape::API
  format :json
  # formatter :json, Grape::Formatter::Roar

  mount V1::HolidaysApi

  add_swagger_documentation(
    info: {
      title: 'Holidays API',
      version: 'v1',
    },
    hide_documentation_path: true,
    mount_path: '/docs',
    hide_format: true
  )
end