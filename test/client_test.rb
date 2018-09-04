require 'test_helper'

module RealPhoneValidation
  class ClientTest < Minitest::Test
    def test_when_a_request_is_made_without_configuring_a_token_it_raises_an_error
      error = assert_raises Error do
        Client.request('/test')
      end
      assert_equal 'The Real Phone Validation API must be configured with a valid API token.', error.message
    end

    def test_when_a_request_is_made_with_a_token_it_actually_makes_the_request
      response = OpenStruct.new(body: 'request')
      HTTP.expects(:get).once.returns(response)
      Ox.expects(:load).once.with('request', mode: :hash)
      ::RealPhoneValidation.config { |config| config.api_token = 'Fake Token' }
      Client.request('/test')
    ensure
      Configuration.instance.api_token = nil
    end
  end
end
