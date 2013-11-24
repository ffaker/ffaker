# encoding: utf-8

module  Faker
  # Author: wiseleyb<wiseleyb@gmail.com>
  # Based on information from http://en.wikipedia.org/wiki/Telephone_numbers_in_Australia
  module PhoneNumberDA
    extend ModuleUtils
    extend self

    # Generates a general phone number
    #  xxxxxxxx
    #
    def home_work_phone_number
      phone_number
    end

    # Generates a mobile phone number
    # xxxxxxxxx
    #
    def mobile_phone_number
      phone_number
    end

    # generates mobile or home/work number
    def phone_number
      Faker.numerify("########")
    end

    def country_code
      "+45"
    end

    def international_mobile_phone_number
      international_phone_number
    end

    def international_home_work_phone_number
      international_phone_number
    end

    def international_phone_number
      Faker.numerify("#{country_code} #{phone_number}")
    end
  end
end
