# frozen_string_literal: true

module FFaker
  module PhoneNumberKR
    extend ModuleUtils
    extend self

    HOME_PHONE_PREFIXES =
      %w[02 031 032 033 041 042 043 044 049 051 052 053 054 055 061 062 063 064].freeze
    MOBILE_PHONE_PREFIXES = %w[010 011 016 019].freeze

    def phone_number
      case rand(0..1)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def home_work_phone_number
      FFaker.numerify("#{fetch_sample(HOME_PHONE_PREFIXES)} #### ####")
    end

    def mobile_phone_number
      FFaker.numerify("#{fetch_sample(MOBILE_PHONE_PREFIXES)} #### ####")
    end

    def contry_code
      '+82'
    end

    def international_mobile_phone_number
      number = mobile_phone_number
      number[0] = "#{contry_code} "
      number
    end

    def international_home_work_phone_number
      number = home_work_phone_number
      number[0] = "#{contry_code} "
      number
    end

    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end
  end
end
