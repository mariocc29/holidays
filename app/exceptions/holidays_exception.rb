# frozen_string_literal: true

module HolidaysException
  # Custom exception class for holiday-related errors.
  class BaseException < ApplicationException::BaseException
    def initialize
      super(self.class::STATUS, self.class::CODE, self.class::MESSAGE)
    end

    def self.to_h(status: self::STATUS, code: self::CODE, message: self::MESSAGE)
      { code: status, message: "[#{code}] - #{message}" }
    end
  end

  # Exception class for representing an Unprocessable Entity error related to holidays.
  class UnprocessableEntityException < BaseException
    STATUS = HttpStatus::UNPROCESSABLE_ENTITY
    CODE = 'ERR004'
    MESSAGE = 'Sorry, we could not process your request due to invalid data.'
  end

  # Exception class for representing a Bad Request error related to holidays.
  class InvalidYearException < BaseException
    STATUS = HttpStatus::BAD_REQUEST
    CODE = 'ERR005'
    MESSAGE = 'The year does not have a valid value. Please make sure the year is 1583 or later.'
  end
end
