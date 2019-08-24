# frozen_string_literal: true

module FFaker
  module PhoneNumberDE
    extend ModuleUtils
    extend self

    # Mobile prefixes are in the 015x, 016x, 017x ranges
    def mobile_prefix(leading_zero = true)
      mobile_prefix = '1' + rand(5..7).to_s + rand(0..9).to_s
      mobile_prefix = '0' + mobile_prefix if leading_zero
      mobile_prefix
    end

    # Region prefixes are in range 02..09 with length of 3 to 5 digits
    def region_prefix(leading_zero = true)
      region_prefix = rand(2..9).to_s + FFaker.numerify('#' * rand(1..3)).to_s
      region_prefix = '0' + region_prefix if leading_zero
      region_prefix
    end

    def phone_number
      home_work_phone_number
    end

    def mobile_phone_number(leading_zero = true)
      [mobile_prefix(leading_zero), FFaker.numerify('#######')].join(' ')
    end

    def home_work_phone_number(leading_zero = true)
      [region_prefix(leading_zero), FFaker.numerify('#######')].join(' ')
    end

    def country_code
      '+49'
    end

    def international_mobile_phone_number
      [country_code, mobile_phone_number(false)].join(' ')
    end

    def international_home_work_phone_number
      [country_code, home_work_phone_number(false)].join(' ')
    end

    def international_phone_number
      international_home_work_phone_number
    end
  end
end
