# frozen_string_literal: true

module FFaker
  module AddressDE
    include FFaker::Address

    extend ModuleUtils
    extend self

    def zip_code
      FFaker.numerify '#####'
    end

    def state
      fetch_sample(STATE)
    end

    def city
      fetch_sample(CITY)
    end

    def street_name
      name = fetch_sample([true, false]) ? NameDE.last_name.to_s : NameDE.first_name.to_s
      name + random_type_of_street
    end

    def street_address
      "#{street_name} #{rand(1..192)}"
    end

    private

    def random_type_of_street
      case rand(0..19)
      when 0 then 'weg'
      when 1 then 'gasse'
      when 3 then 'hain'
      else 'str.'
      end
    end
  end
end
