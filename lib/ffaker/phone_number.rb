# encoding: utf-8

module Faker
  module PhoneNumber
    extend ModuleUtils
    extend self

    def phone_number
      Faker.numerify case rand(20)
      when      0 then '###-###-#### x#####'
      when      1 then '###-###-#### x####'
      when      2 then '###-###-#### x###'
      when   3..4 then '###-###-####'
      when      5 then '###.###.#### x#####'
      when      6 then '###.###.#### x####'
      when      7 then '###.###.#### x###'
      when   8..9 then '###.###.####'
      when     10 then '(###)###-#### x#####'
      when     11 then '(###)###-#### x####'
      when     12 then '(###)###-#### x###'
      when 13..14 then '(###)###-####'
      when     15 then '1-###-###-#### x#####'
      when     16 then '1-###-###-#### x####'
      when     17 then '1-###-###-#### x###'
      when 18..19 then '1-###-###-####'
      end
    end

    def short_phone_number
      Faker.numerify('###-###-####')
    end

  end
end
