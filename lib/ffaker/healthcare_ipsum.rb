# encoding: utf-8

module Faker
  module HealthcareIpsum
    extend ModuleUtils
    extend Lorem
    extend self

    def word
      HEALTHCARE_WORDS.rand
    end

    def words(num = 3)
      HEALTHCARE_WORDS.random_pick(num)
    end
  end
end
