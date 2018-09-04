require 'test_helper'

module RealPhoneValidation
  class PhoneNumberTest < Minitest::Test
    def stub_client(overrides = {})
      Client.stubs(:request).returns({
        response: {
          RESPONSECODE: 'OK',
          RESPONSEMSG: '',
          national_dnc: 'N',
          state_dnc: 'N',
          dma: 'N',
          litigator: 'N',
          iscell: 'N',
          id: '12345',
        }.merge(overrides)
      })
    end


    def test_non_numeric_characters_get_stripped_out_on_initialization
      ['(555)-555-5555', '(555) 555 - 5555', '(555)555-5555', '555-555-5555', '5555555555'].each do |number|
        assert_equal '5555555555', PhoneNumber.new(number).instance_variable_get('@phone_number')
      end
    end

    def test_looking_up_a_valid_phone_number_returns_a_lookup_object
      stub_client
      assert PhoneNumber.new('555-555-5555').dnc_lookup.is_a?(PhoneNumber::DNCLookupResult)
    end

    def test_when_the_api_returns_an_error_that_error_is_passed_on_and_raised
      stub_client(RESPONSECODE: 'ERROR', RESPONSEMSG: 'This is an error')
      error = assert_raises Error do
        PhoneNumber.new('555-555-5555').dnc_lookup
      end
      assert_equal 'This is an error', error.message
    end

    def test_dnc_works_correctly_when_on_the_national_registry
      stub_client national_dnc: 'Y'
      assert PhoneNumber.new('555-555-5555').dnc_lookup.dnc?
    end

    def test_dnc_works_correctly_when_on_state_registry
      stub_client state_dnc: 'Y'
      assert PhoneNumber.new('555-555-5555').dnc_lookup.dnc?
    end

    def test_dnc_works_correctly_when_on_dma_registry
      stub_client dma: 'Y'
      assert PhoneNumber.new('555-555-5555').dnc_lookup.dnc?
    end

    def test_dnc_works_correctly_when_not_on_any_registrys
      stub_client
      refute PhoneNumber.new('555-555-5555').dnc_lookup.dnc?
    end
  end
end
