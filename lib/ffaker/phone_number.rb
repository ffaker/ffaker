# encoding: utf-8

module FFaker
  module PhoneNumber
    extend ModuleUtils
    extend self

    def phone_number
      FFaker.numerify case rand(20)
      when      0 then "#{area_code}-###-#### x#####"
      when      1 then "#{area_code}-###-#### x####"
      when      2 then "#{area_code}-###-#### x###"
      when   3..4 then "#{area_code}-###-####"
      when      5 then "#{area_code}.###.#### x#####"
      when      6 then "#{area_code}.###.#### x####"
      when      7 then "#{area_code}.###.#### x###"
      when   8..9 then "#{area_code}.###.####"
      when     10 then "(#{area_code})###-#### x#####"
      when     11 then "(#{area_code})###-#### x####"
      when     12 then "(#{area_code})###-#### x###"
      when 13..14 then "(#{area_code})###-####"
      when     15 then "1-#{area_code}-###-#### x#####"
      when     16 then "1-#{area_code}-###-#### x####"
      when     17 then "1-#{area_code}-###-#### x###"
      when 18..19 then "1-#{area_code}-###-####"
      end
    end

    def area_code
      # The North American Numbering Plan (NANP) does not permit the digits 0
      # and 1 as the leading digit of an area code.
      # https://en.wikipedia.org/wiki/List_of_North_American_Numbering_Plan_area_codes
      loop do
        rand_area_code = rand(201..999)
        return rand_area_code unless rand_area_code % 100 == 11
      end
    end

    def short_phone_number
      FFaker.numerify("#{area_code}-###-####")
    end

    def imei(serial_number=nil)
      # IMEI Format:
      # AA-BBBBBB-CCCCCC-D

      rbi = "00"            # Test IMEI for countries with 2-digit country codes
      tac = "#{rbi}124500"  # iPhone

      serial_number ||= rand(1_000_000)
      serial_number = sprintf('%06d', serial_number)

      imei_base = tac + serial_number

      check_digit = 0
      base_digits = imei_base.split('').map(&:to_i)
      base_digits.each_with_index do |digit, i|
        check_digit += i.even? ? 2*digit : digit
      end
      check_digit = (10 - check_digit % 10) % 10

      "#{imei_base}#{check_digit}"
    end

  end
end
