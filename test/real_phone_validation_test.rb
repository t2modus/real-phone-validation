require "test_helper"

class RealPhoneValidationTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::RealPhoneValidation::VERSION
  end
end
