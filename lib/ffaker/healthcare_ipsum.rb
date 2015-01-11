# encoding: utf-8

require 'ffaker/lorem'

module Faker
  module HealthcareIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      HEALTHCARE_WORDS.sample
    end

    def words(num = 3)
      HEALTHCARE_WORDS.random_pick(num)
    end
  end
end
