module FFaker
  module PhoneNumberUA
    extend ModuleUtils
    extend self

    LOCAL_PREFIX = '0'.freeze
    COUNTRY_PREFIX = '+380 '.freeze
    PHONE_NUMBER = ' ###-####'.freeze

    def phone_number
      rand(0..1).zero? ? home_phone_number : mobile_phone_number
    end

    def home_phone_number
      local_number(HOME_PHONE_PREFIXES)
    end

    def mobile_phone_number
      local_number(MOBILE_PHONE_PREFIXES)
    end

    def international_home_phone_number
      international_number(HOME_PHONE_PREFIXES)
    end

    def international_mobile_phone_number
      international_number(MOBILE_PHONE_PREFIXES)
    end

    private

    def local_number(prefixes)
      FFaker.numerify([LOCAL_PREFIX, fetch_sample(prefixes), PHONE_NUMBER].join(''))
    end

    def international_number(prefixes)
      FFaker.numerify([COUNTRY_PREFIX, fetch_sample(prefixes), PHONE_NUMBER].join(''))
    end
  end
end
