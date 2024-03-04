# frozen_string_literal: true

module Core
  # Class for processing rules.
  class RuleProcess
    attr_reader :code, :key

    def initialize(full_code)
      @code, @key = full_code.split('_', 2)
      @key = full_code unless @key.nil?
      @key ||= 'default'
    end

    def settings
      file_path = Rails.root.join('config', 'rules', "#{@code}.yml")
      holidays = YAML.safe_load(File.read(file_path))[@code]

      raise HolidaysException::UnprocessableEntityException if holidays['default'].nil?

      holidays['default'].merge(holidays[@key] || {})
    end
  end
end
