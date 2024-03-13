module Core
  module Components
    module CO
      # Service class for Colombia (CO).
      class Service < Core::Components::Base
        def all_saints_day
          # All Saints' Day on November 1st.
          adjust_date_to_next_weekday Date.new(year, 11, 1)
        end

        def ascension_day
          # Ascension Day.
          @easter_sunday + 43
        end

        def assumption_of_mary
          # Assumption of Mary on August 15th.
          adjust_date_to_next_weekday Date.new(year, 8, 15)
        end

        def battle_of_boyaca
          # Battle of Boyacá on August 7th.
          Date.new(year, 8, 7)
        end

        def columbus_day
          # Columbus Day on October 12th.
          adjust_date_to_next_weekday Date.new(year, 10, 12)
        end

        def corpus_christi
          # Corpus Christi.
          @easter_sunday + 64
        end

        def epiphany
          # Epiphany on January 6th.
          adjust_date_to_next_weekday Date.new(year, 1, 6)
        end

        def immaculate_conception_day
          # Immaculate Conception Day on December 8th.
          Date.new(year, 12, 8)
        end

        def independence_day
          # Independence Day on July 20th.
          Date.new(year, 7, 20)
        end

        def independence_of_cartagena
          # Independence of Cartagena on November 11th.
          adjust_date_to_next_weekday Date.new(year, 11, 11)
        end

        def labor_day
          # Labor Day on May 1st.
          Date.new(year, 5, 1)
        end

        def maundy_thursday
          # Maundy Thursday.
          @easter_sunday - 3
        end

        def sacred_heart
          # Sacred Heart.
          @easter_sunday + 71
        end

        def saint_josephs_day
          # Saint Joseph's Day on March 19th.
          adjust_date_to_next_weekday Date.new(year, 3, 19)
        end

        def saint_peter_and_saint_paul
          # Saint Peter and Saint Paul on June 29th.
          adjust_date_to_next_weekday Date.new(year, 6, 29)
        end

        private

        # Adjusts the date to the next weekday if necessary.
        def adjust_date_to_next_weekday(date)
          if date.wday.positive? && date.wday != 1
            date += (8 - date.wday)
          elsif date.wday.zero?
            date += 1
          end
          date
        end
      end

      SERVICES = {
        default: Components::CO::Service
      }.freeze
    end
  end
end
