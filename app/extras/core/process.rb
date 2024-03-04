# frozen_string_literal: true

module Core
  # The Process class defines methods for building and processing data.
  class Process
    attr_reader :rule, :locale, :year

    def initialize(rule, locale, year)
      @rule = rule
      @locale = locale
      @year = year
    end

    def build
      [
        { date: '2024-01-01', label: 'Holiday', note: 'xxxx' }
      ]
    end
  end
end
