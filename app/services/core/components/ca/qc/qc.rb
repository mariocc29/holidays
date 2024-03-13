# frozen_string_literal: true

module Core
  module Components
    module CA
      module QC
        # Service class specific to Quebec (QC), Canada.
        class Service < Core::Components::CA::Service
          def journee_des_patriotes
            # The Patriots' Day is the Monday before May 25th.
            date = Date.new(year, 5, 25).prev_day
            date -= date.wday - 1 if date.wday > 1
            date -= 6 if date.wday.zero?
            date
          end

          def saint_jean_baptiste
            # Saint-Jean-Baptiste Day is on June 24th.
            Date.new(year, 6, 24)
          end
        end
      end
    end
  end
end
