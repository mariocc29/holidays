# frozen_string_literal: true

module HolidaysException
  # Custom exception class for holiday-related errors.
  class BaseException < ApplicationException::BaseException
    def initialize
      super(self.class::STATUS, self.class::CODE, self.class::MESSAGE)
    end

    def self.to_h(status: self.class::STATUS, code: self::CODE, message: self::MESSAGE)
      { code: status, message: "[#{code}] - #{message}" }
    end
  end

  # Exception class for representing an Unprocessable Entity error related to holidays.
  class UnprocessableEntityException < BaseException
    STATUS = HttpStatus::UNPROCESSABLE_ENTITY
    CODE = 'ERR004'
    MESSAGE = 'Sorry, we could not process your request due to invalid data.'
  end
end
