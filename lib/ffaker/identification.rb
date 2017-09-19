# encoding: utf-8

module FFaker
  module Identification
    extend ModuleUtils
    extend self

    ETHNICITIES = ['African American', 'Asian/Pacific Islander', 'Caucasian', 'Hispanic', 'Native American', 'Multiracial', 'Other', 'Prefer not to respond'].freeze
    GENDERS = %w[Male Female].freeze

    def drivers_license
      FFaker.bothify('?###-###-##-###-#').upcase
    end

    def ssn
      FFaker.numerify('###-##-####')
    end

    def ethnicity
      fetch_sample(ETHNICITIES)
    end

    def gender
      fetch_sample(GENDERS)
    end
  end
end
