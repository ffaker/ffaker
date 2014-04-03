# encoding: utf-8

require 'ffaker/address'

module Faker
  module AddressBR
    include Faker::Address

    extend ModuleUtils
    extend self

    def zip_code
      Faker.numerify '#####-###'
    end

    def state
      STATE.rand
    end

    def state_abbr
      STATE_ABBR.rand
    end

    def city
      CITY.rand
    end

    def street_prefix
      STREET_PREFIX.rand
    end

    def street
      case rand(1)
      when 0 then "#{street_prefix} #{NameBR.name}"
      when 1 then "#{street_prefix} #{NameBR.first_name} #{NameBR.last_name} #{NameBR.last_name}"
      end
    end

    STREET_PREFIX = k %w( Rua Avenida Travessa Alameda )
  end
end
