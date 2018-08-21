# frozen_string_literal: true

require 'singleton'
require 'http'
require 'ox'

require 'real_phone_validation/version'
require 'real_phone_validation/configuration'
require 'real_phone_validation/error'
require 'real_phone_validation/client'
require 'real_phone_validation/phone_number'

# This module handles the interface with RealPhoneValidation's APIs
module RealPhoneValidation
  class << self
    def config
      Configuration.instance.tap { |config| yield config }
    end

    alias configure config

    def configuration
      Configuration.instance
    end
  end
end
