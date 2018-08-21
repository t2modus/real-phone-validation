# frozen_string_literal: true

module RealPhoneValidation
  class PhoneNumber
    # This class is used to represent the result of a lookup to the DNC API
    class DNCLookupResult
      attr_reader :response_code, :response_message, :national, :state, :dma, :litigator, :is_cell, :id
      def initialize(phone_number, result_hash)
        @phone_number = phone_number
        @response_code, @response_message = result_hash.values_at(:RESPONSECODE, :RESPONSEMSG)
        @national, @state, @dma, @litigator, @is_cell = result_hash.values_at(:national_dnc, :state_dnc, :dma, :litigator, :iscell)
                                                                   .map { |v| v == 'Y' }
        @real_phone_validation_id = result_hash[:id]
      end

      def dnc?
        @national || @state || @dma
      end
    end
  end
end
