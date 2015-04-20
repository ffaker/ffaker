# encoding: utf-8

module Faker
  module AddressES
    extend ModuleUtils
    extend self

    def zip_code
      Faker.numerify('#####')
    end

    def postal_code
      Faker.numerify('#####')
    end

    def province
      PROVINCE.rand
    end

    def city
      CITY.rand
    end

  end
end
