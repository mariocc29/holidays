# frozen_string_literal: true

module V1
  module Entities
    # Defines the structure for serializing holiday information.
    class HolidayEntity < Grape::Entity
      expose :date, documentation: { type: Date, desc: 'Date of the holiday.' }
      expose :label, documentation: { type: String, desc: 'Label or name of the holiday.' }
    end
  end
end
