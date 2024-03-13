# frozen_string_literal: true

module Core
  # Class for processing rules.
  class RuleProcess
    attr_reader :country, :region

    def initialize(code)
      @country, @region = code.split('_', 2)
      @region = code unless @region.nil?
      @region ||= 'default'
    end

    def settings
      file_path = Rails.root.join('config', 'rules', "#{@country}.yml")
      holidays = YAML.safe_load(File.read(file_path))[@country]

      raise HolidaysException::UnprocessableEntityException if holidays['default'].nil?

      holidays['default'].merge(holidays[@region] || {})
    end
  end
end
