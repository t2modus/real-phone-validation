# frozen_string_literal: true

require 'real_phone_validation/phone_number/dnc_lookup_result'

module RealPhoneValidation
  # This class takes a string as an input, sanitizes it,
  # and provides various operations that can be performed
  # on it.
  class PhoneNumber
    def initialize(number)
      @phone_number = number&.gsub(/\D/, '')
    end

    def dnc_lookup
      result = DNCLookupResult.new(
        @phone_number,
        Client.request("DNCLookup.php?phone=#{@phone_number}")[:response]
      )
      return result if result.response_code == 'OK'
      raise Error, result.response_message
    end
  end
end
