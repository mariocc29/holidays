# frozen_string_literal: true

module Core
  # The Handler class is responsible for retrieving and processing data.
  class Handler
    # Retrieves and processes data based on the specified code.
    def self.get(code, locale = nil, year = nil)
      rule = Core::RuleProcess.new code
      year ||= Date.today.year

      process = Core::Process.new rule, locale, year
      process.build
    end
  end
end
