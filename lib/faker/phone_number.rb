module Faker
  module PhoneNumber
    extend ModuleUtils
    extend self

    def phone_number
      Faker.numerify(FORMATS.rand)
    end

    def self.short_phone_number
      Faker.numerify(FORMATS.first.dup)
    end

    FORMATS = k [
      '###-###-####',
      '(###)###-####',
      '1-###-###-####',
      '###.###.####',
      '###-###-####',
      '(###)###-####',
      '1-###-###-####',
      '###.###.####',
      '###-###-#### x###',
      '(###)###-#### x###',
      '1-###-###-#### x###',
      '###.###.#### x###',
      '###-###-#### x####',
      '(###)###-#### x####',
      '1-###-###-#### x####',
      '###.###.#### x####',
      '###-###-#### x#####',
      '(###)###-#### x#####',
      '1-###-###-#### x#####',
      '###.###.#### x#####'
    ]
  end
end
