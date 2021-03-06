# frozen_string_literal: true

module RealPhoneValidation
  # This class is responsible for actually making API requests to the
  # RealPhoneValidation API
  class Client
    BASE_URL = 'https://api.realvalidation.com/rpvWebService/'
    # DNCLookup.php?phone=7275555555&token=1234ABCD-1234-ABCD-1234-123456ABCDEF'

    class << self
      def request(url)
        if Configuration.instance.api_token
          Ox.load(HTTP.get("#{BASE_URL}#{url}&token=#{Configuration.instance.api_token}").body.to_s, mode: :hash)
        else
          raise ::RealPhoneValidation::Error, 'The Real Phone Validation API must be configured with a valid API token.'
        end
      end
    end
  end
end
