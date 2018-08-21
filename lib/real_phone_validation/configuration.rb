# frozen_string_literal: true

module RealPhoneValidation
  # This class is responsible for storing configuration information, primarily the
  # API token to be used when making requests
  class Configuration
    include Singleton
    attr_accessor :api_token
    def initialize
      @api_token = ENV['REAL_PHONE_VALIDATION_API_TOKEN']
    end
  end
end
