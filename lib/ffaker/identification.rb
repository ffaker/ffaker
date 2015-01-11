# encoding: utf-8

module FFaker
  module Identification
    extend ModuleUtils
    extend self

    def drivers_license
      FFaker.bothify('?###-###-##-###-#').upcase
    end

    def ssn
      FFaker.numerify('###-##-####')
    end

    def ethnicity
      ETHNICITIES.rand
    end

    def gender
      GENDERS.rand
    end

    ETHNICITIES = k ['African American', 'Asian/Pacific Islander', 'Caucasian', 'Hispanic', 'Native American', 'Multiracial', 'Other', 'Prefer not to respond']
    GENDERS = k %w(Male Female)
  end
end
