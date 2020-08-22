# frozen_string_literal: true

module FFaker
  module AddressNL
    include FFaker::Address

    extend ModuleUtils
    extend self

    def postal_code
      FFaker::String.from_regexp(/[1-9]\d{3} [A-RT-Z][A-Z]/)
    end

    def zip_code
      postal_code
    end

    def street_name
      name = fetch_sample([true, false]) ? NameNL.last_name : NameNL.first_name
      name + random_type_of_street
    end

    def city
      fetch_sample(CITY)
    end

    def province
      fetch_sample(PROVINCE)
    end

    private

    def random_type_of_street
      case rand(0..19)
      when 0 then 'weg'
      when 1 then 'boulevard'
      when 3 then 'pad'
      when 4 then 'steeg'
      else 'straat'
      end
    end
  end
end
