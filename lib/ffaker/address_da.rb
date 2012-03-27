module Faker
  module AddressDA
    include Faker::Address
    extend ModuleUtils
    extend self

    def zip_code
      Faker.numerify ZIP_FORMATS.rand
    end

    def state
      STATE.rand
    end

    def city
      CITY.rand
    end

    ZIP_FORMATS = k ['####']

    def street_name
      STREET.rand
    end

    def street_address
      "#{Faker::AddressDA.street_address} #{rand(100)}"
    end

    STREET = k [
      'maglekildevej', 'griffenfeldsgade', 'frederiksberg alle', 'kgs. nytorv', 'øster alle', 'lyngbyvej',
      'pile alle', 'gothersgade'
    ]

    STATE = k [
      'Nord Jylland', 'Vest Jylland', 'Øst Jylland', 'Syd Jylland', 'Fyn',
      'Lolland Falster', 'København'
    ]

    CITY = k %w(
      Århus Ålborg Helsingør København Kolding Middelfart Ribe Randers Slagelse Skagen
    )
  end
end
