require 'test_helper'

module RealPhoneValidation
  class ConfigurationTest < Minitest::Test
    def test_api_token_can_be_configured
      assert_nil Configuration.instance.api_token
      Configuration.instance.api_token = 'Fake Token'
      assert_equal 'Fake Token', Configuration.instance.api_token
    end
  end
end
