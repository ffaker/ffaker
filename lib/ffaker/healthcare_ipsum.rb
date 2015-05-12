# encoding: utf-8

require 'ffaker/lorem'

module FFaker
  module HealthcareIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      HEALTHCARE_WORDS.sample
    end

    def words(num = 3)
      HEALTHCARE_WORDS.sample(num)
    end
  end
end
