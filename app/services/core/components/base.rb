# frozen_string_literal: true

module Core
  module Components
    # The base class for components that provide date-related calculations.
    class Base
      attr_reader :easter_sunday

      def initialize(year)
        @year = year
        @easter_sunday = easter_sunday_day
      end

      def new_year
        Date.new(year, 1, 1)
      end

      def new_year_next_day
        Date.new(year, 1, 2)
      end

      def good_friday
        @easter_sunday - 2
      end

      def easter_monday
        @easter_sunday + 1
      end

      def christmas_eve
        Date.new(year, 12, 24)
      end

      def christmas
        Date.new(year, 12, 25)
      end

      def christmas_next_day
        Date.new(year, 12, 26)
      end

      def new_years_eve
        Date.new(year, 12, 31)
      end

      protected

      attr_reader :year

      private

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/MethodLength
      def easter_sunday_day
        raise HolidaysException::InvalidYearException if year < 1583

        a = year % 19
        b = year / 100
        c = year % 100
        d = b / 4
        e = b % 4
        f = (b + 8) / 25
        g = (b - f + 1) / 3
        h = (19 * a + b - d - g + 15) % 30
        i = c / 4
        k = c % 4
        l = (32 + 2 * e + 2 * i - h - k) % 7
        m = (a + 11 * h + 22 * l) / 451
        month = (h + l - 7 * m + 114) / 31
        day = ((h + l - 7 * m + 114) % 31) + 1

        Date.new(year, month, day)
      end
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize
    end
  end
end
