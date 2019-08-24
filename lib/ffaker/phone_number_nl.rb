# frozen_string_literal: true

module FFaker
  module PhoneNumberNL
    extend ModuleUtils
    extend self

    COUNTRY_CODE = '+31'
    AREA_CODE_PREFIX = '0'
    PHONE_NUMBER = {
      2 => ['#######', '### ####', '#### ###'],
      3 => ['######', '#### ##', '## ## ##']
    }.freeze
    MOBILE_PHONE_NUMBER = ['########', ' ## ## ## ##', ' ### ### ##', ' #### ####'].freeze

    def phone_number
      return home_work_phone_number if rand(0..1).zero?

      mobile_phone_number
    end

    def home_work_phone_number
      area = fetch_sample(AREA_CODES)
      FFaker.numerify "#{AREA_CODE_PREFIX}#{area}-#{fetch_sample(PHONE_NUMBER[area.size])}"
    end

    def mobile_phone_number
      FFaker.numerify "#{AREA_CODE_PREFIX}6#{fetch_sample(MOBILE_PHONE_NUMBER)}"
    end

    def international_phone_number
      return international_mobile_phone_number if rand(0..1).zero?

      international_home_work_phone_number
    end

    def international_home_work_phone_number
      area = fetch_sample(AREA_CODES)
      FFaker.numerify("#{COUNTRY_CODE} #{area}-#{fetch_sample(PHONE_NUMBER[area.size])}")
    end

    def international_mobile_phone_number
      FFaker.numerify("#{COUNTRY_CODE} 6#{fetch_sample(MOBILE_PHONE_NUMBER)}")
    end
  end
end
