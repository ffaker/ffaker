# frozen_string_literal: true

require 'date'

module FFaker
  module IdentificationPL
    extend ModuleUtils
    extend self

    # Polish national identification number
    # https://en.wikipedia.org/wiki/PESEL
    def pesel
      date = generate_valid_pesel_date
      birthdate = pesel_birthdate(date)
      serial_number = FFaker.numerify('####')
      checksum = pesel_checksum(birthdate, serial_number)
      "#{birthdate}#{serial_number}#{checksum}"
    end

    # Polish identity card number
    # https://en.wikipedia.org/wiki/Polish_identity_card
    def identity_card
      letter_part = FFaker.letterify('???').upcase
      number_part = FFaker.numerify('#####')
      checksum = identity_card_checksum(letter_part, number_part)
      "#{letter_part}#{checksum}#{number_part}"
    end

    alias id identity_card

    # Polish driver's licence number
    # https://en.wikipedia.org/wiki/Driving_licence_in_Poland
    def drivers_license
      FFaker.numerify('#####/##/####')
    end

    private

    def generate_valid_pesel_date
      from = Date.new(1800, 1, 1)
      to = [Date.today, Date.new(2299, 12, 31)].min
      fetch_sample(from..to)
    end

    def pesel_birthdate(date)
      century_differentiator = pesel_century_differentiator(date.year)

      year = date.strftime('%y')
      month = century_differentiator.zero? ? date.strftime('%m') : date.month + century_differentiator
      day = date.strftime('%d')

      "#{year}#{month}#{day}"
    end

    def pesel_century_differentiator(year)
      case year
      when 1800..1899 then 80
      when 2000..2099 then 20
      when 2100..2199 then 40
      when 2200..2299 then 60
      else 0
      end
    end

    def pesel_checksum(date, serial_number)
      pesel_digits = "#{date}#{serial_number}".split('').map(&:to_i)
      a, b, c, d, e, f, g, h, i, j = pesel_digits
      (a * 9 + b * 7 + c * 3 + d + e * 9 + f * 7 + g * 3 + h + i * 9 + j * 7) % 10
    end

    def identity_card_checksum(letter_part, number_part)
      a, b, c = letter_part.codepoints.map { |codepoints| codepoints - 55 }
      d, e, f, g, h = number_part.split('').map(&:to_i)
      (a * 7 + b * 3 + c + 7 * d + 3 * e + f + 7 * g + 3 * h) % 10
    end
  end
end
