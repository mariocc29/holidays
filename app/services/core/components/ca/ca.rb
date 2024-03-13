# frozen_string_literal: true

module Core
  module Components
    # Module for components specific to Canada (CA).
    module CA
      # Module for components specific to Quebec (QC), Canada.
      autoload :QC, './app/services/core/components/ca/qc/qc'

      # Service class for Canada (CA).
      class Service < Core::Components::Base
        def canada_day
          # Canada Day is on July 1st.
          Date.new(year, 7, 1)
        end

        def labor_day
          # Labor Day is the first Monday in September.
          beginning_of_the_month = Date.new(year, 9, 1)
          beginning_of_the_month + ((1 - beginning_of_the_month.wday + 7) % 7)
        end

        def thanksgiving
          # The Thanksgiving Day in Canada is on the second Monday of October
          beginning_of_the_month = Date.new(year, 10, 1)
          first_monday_of_october = beginning_of_the_month + ((1 - beginning_of_the_month.wday + 7) % 7)
          first_monday_of_october + 7
        end

        def remembrance_day
          # The Remembrance Day in Canada is on November 11th
          Date.new(year, 11, 11)
        end
      end

      SERVICES = {
        ca_qc: Core::Components::CA::QC::Service,
        default: Core::Components::CA::Service
      }.freeze
    end
  end
end