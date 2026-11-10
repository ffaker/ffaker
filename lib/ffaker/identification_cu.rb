# frozen_string_literal: true

require 'date'

module FFaker
  module IdentificationCU
    extend ModuleUtils
    extend self

    # Generates a Cuban Carnet de Identidad (CI): 11 digits.
    #
    # Format per LookupTax Cuba Tax ID guide:
    #   1-6  Date of birth YYMMDD
    #   7    Century digit (9 = 19th, 0-5 = 20th, 6-8 = 21st)
    #   8-9  Sequential number (00-99)
    #   10   Gender digit (even = male, odd = female)
    #   11   Check digit
    #
    # No published weight-based checksum exists; integrity relies on a valid
    # birth date, so the date portion is always a real calendar date.
    def ci
      birth_date = random_birth_date
      yy = birth_date.strftime('%y')
      mm = birth_date.strftime('%m')
      dd = birth_date.strftime('%d')

      century = century_digit(birth_date.year)
      sequential = rand(0..99).to_s.rjust(2, '0')
      gender = rand(0..9)
      check = rand(0..9)

      "#{yy}#{mm}#{dd}#{century}#{sequential}#{gender}#{check}"
    end

    private

    def random_birth_date
      year = rand(1900..2024)
      month = rand(1..12)
      day = rand(1..28)
      ::Date.new(year, month, day)
    end

    def century_digit(year)
      case year
      when 1800..1899 then 9
      when 1900..1999 then rand(0..5)
      when 2000..2099 then rand(6..8)
      end
    end
  end
end
