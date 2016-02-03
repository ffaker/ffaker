# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressDE
    include FFaker::Address

    extend ModuleUtils
    extend self

    def zip_code
      FFaker.numerify '#####'
    end

    def state
      STATE.sample
    end

    def city
      CITY.sample
    end

    def street_name
      name = [true, false].sample ? NameDE.last_name.to_s : NameDE.first_name.to_s
      name + random_type_of_street
    end

    def street_address
      "#{street_name} #{1 + rand(192)}"
    end

    private

    def random_type_of_street
      case rand(20)
      when 0 then 'weg'
      when 1 then 'gasse'
      when 3 then 'hain'
      else 'str.'
      end
    end
  end
end
