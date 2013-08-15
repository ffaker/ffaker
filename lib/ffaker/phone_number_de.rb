# encoding: utf-8

# => author: lawitschka
# => email: moritz.lawitschka@urbanvention.com
module Faker
  module PhoneNumberDE
    extend ModuleUtils
    extend self

    # Mobile prefixes are in the 015x, 016x, 017x ranges
    def mobile_prefix
      '01' + (rand(3) + 5).to_s + rand(10).to_s
    end

    # Region prefixes are in range 02..09 with length of 3 to 5 digits
    def region_prefix
      '0' + (rand(8) + 2).to_s + Faker.numerify( '#' * (rand(3) + 1) ).to_s
    end

    def phone_number
      home_work_phone_number
    end

    def mobile_phone_number
      [mobile_prefix, Faker.numerify('#######')].join(' ')
    end

    def home_work_phone_number
      [region_prefix, Faker.numerify('########')].join(' ')
    end

    def country_code
      '+49'
    end

    def international_mobile_phone_number
      [country_code, mobile_phone_number].join(' ')
    end

    def international_home_work_phone_number
      [country_code, home_work_phone_number].join(' ')
    end

    def international_phone_number
      international_home_work_phone_number
    end
  end
end