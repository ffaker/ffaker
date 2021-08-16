# frozen_string_literal: true

module FFaker
  module IdentificationIT
    extend ModuleUtils
    extend self

    ETHNICITIES = [
      'Afroamericano', 'Asiatico/isolano del Pacifico', 'Caucasico', 'Ispanico', 'Nativo americano',
      'Multirazziale', 'Altro', 'Preferisco non rispondere'
    ].freeze
    GENDERS = %w[Maschio Femmina].freeze

    def drivers_license
      FFaker::String.from_regexp(/U1[1-9]\d{7}[A-Z]/)
    end

    def ssn
      FFaker.numerify('####################')
    end

    def ethnicity
      fetch_sample(ETHNICITIES)
    end

    def gender
      fetch_sample(GENDERS)
    end
  end
end
