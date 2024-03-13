# frozen_string_literal: true

module Core
  # The Process class defines methods for building and processing data.
  class Process
    SERVICES_BY_COUNTRY = {}.freeze

    def initialize(rule, locale, year)
      @rule = rule
      @locale = locale
      @year = year
    end

    # rubocop:disable Metrics/MethodLength
    def build
      service = initialize_service

      holidays_data = []

      I18n.with_locale @locale do
        @rule.settings.each_key do |holiday|
          next unless service.respond_to?(holiday)

          holidays_data << {
            date: service.send(holiday),
            label: I18n.t("core.holidays.#{holiday}")
          }
        end
      end

      holidays_data.sort_by { |item| item[:date] }
    end
    # rubocop:enable Metrics/MethodLength

    private

    attr_reader :rule, :locale, :year

    def initialize_service
      services = SERVICES_BY_COUNTRY.fetch(@rule.country.to_sym)
      service = services.fetch(@rule.region.to_sym)
      service.new @year
    end
  end
end
