# encoding: utf-8

module FFaker
  module PhoneNumber
    extend ModuleUtils
    extend self

    def phone_number
      FFaker.numerify case rand(0..19)
                      when 0 then "#{area_code}-#{exchange_code}-#### x#####"
                      when 1 then "#{area_code}-#{exchange_code}-#### x####"
                      when 2 then "#{area_code}-#{exchange_code}-#### x###"
                      when 3..4 then "#{area_code}-#{exchange_code}-####"
                      when 5 then "#{area_code}.#{exchange_code}.#### x#####"
                      when 6 then "#{area_code}.#{exchange_code}.#### x####"
                      when 7 then "#{area_code}.#{exchange_code}.#### x###"
                      when 8..9 then "#{area_code}.#{exchange_code}.####"
                      when 10 then "(#{area_code})#{exchange_code}-#### x#####"
                      when 11 then "(#{area_code})#{exchange_code}-#### x####"
                      when 12 then "(#{area_code})#{exchange_code}-#### x###"
                      when 13..14 then "(#{area_code})#{exchange_code}-####"
                      when 15 then "1-#{area_code}-#{exchange_code}-#### x#####"
                      when 16 then "1-#{area_code}-#{exchange_code}-#### x####"
                      when 17 then "1-#{area_code}-#{exchange_code}-#### x###"
                      when 18..19 then "1-#{area_code}-#{exchange_code}-####"
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

    def exchange_code
      # The North American Numbering Plan (NANP) does not permit the digits 0
      # and 1 as the leading digit of the exchange code.
      # https://en.wikipedia.org/wiki/North_American_Numbering_Plan#Numbering_system
      area_code
    end

    def short_phone_number
      FFaker.numerify("#{area_code}-#{exchange_code}-####")
    end

    def phone_calling_code
      fetch_sample(PHONE_CALLING_CODE)
    end

    def imei(serial_number = nil)
      # IMEI Format:
      # AA-BBBBBB-CCCCCC-D
      characters = Array.new(15, 0)
      rbi_codes  = %w[01 10 30 33 35 44 45 49 50 51 52 53 54 86 91 98 99]
      serial_number ||= rand(0...1_000_000)
      serial_number = format('%06d', serial_number).chars.map(&:to_i)
      first_two_chars = fetch_sample(rbi_codes)
      characters[0, 2] = first_two_chars.chars.map(&:to_i)
      # serial number part
      2.upto(7) do |current_position|
        characters[current_position] = fetch_sample((0..9).to_a)
      end
      8.upto(13) do |current_position|
        characters[current_position] = serial_number[current_position - 8]
      end
      current_checksum = characters.reverse.each_with_index.inject(0) do |sum, (digit, i)|
        digit *= 2 if i.odd?
        digit -= 9 if digit > 9
        sum + digit
      end
      final_digit = (10 - (current_checksum % 10)) % 10
      characters[14] = final_digit
      characters.join
    end
  end
end
