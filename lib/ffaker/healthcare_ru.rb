# frozen_string_literal: true

module FFaker
  module HealthcareRU
    extend ModuleUtils
    extend self

    def doctor_specialization
      fetch_sample(DOCTOR_SPECIALIZATION)
    end
  end
end
