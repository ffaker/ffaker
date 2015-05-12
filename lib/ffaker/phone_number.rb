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
      rand(201..999)
    end

    def short_phone_number
      FFaker.numerify("#{area_code}-###-####")
    end

  end
end
