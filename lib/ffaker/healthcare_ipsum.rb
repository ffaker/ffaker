# frozen_string_literal: true

module FFaker
  module HealthcareIpsum
    include Lorem

    extend ModuleUtils
    extend self

    def word
      fetch_sample(HEALTHCARE_WORDS)
    end

    def words(num = 3)
      fetch_sample(HEALTHCARE_WORDS, count: num)
    end
  end
end
