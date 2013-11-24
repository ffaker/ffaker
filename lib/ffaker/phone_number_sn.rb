# encoding: utf-8

module  Faker
  # Author: PapePathe<pathe.sene@xarala.sn> http://www.xarala.sn
  module PhoneNumberSN
    extend ModuleUtils
    extend self

    # Mobile Operator prefixes
    #
    #  77 =>  Orange
    #  76 =>  Tigo
    #  70 =>  Expresso
    #
    MobileOperatorsPrefix = %w(70 76 77)

    # Home or Work Operator prefixes
    #
    #  33 =>  Orange
    #
    HomeWorkOperatorsPrefix = %w(33)

    # Return a prefix in MobileOperatorsPrefix
    # @see Faker::PhoneNumberSN::MobileOperatorsPrefix
    #
    def mobile_phone_prefix
      MobileOperatorsPrefix[rand(3)]
    end

    # Return a prefix in HomeWorkOperatorsPrefix
    # @see Faker::PhoneNumberSN::HomeWorkOperatorsPrefix
    #
    def homework_phone_prefix
      HomeWorkOperatorsPrefix[0]
    end

    # Pattern that can be combined with a prefix to generate mobile, office phone_numbers
    # Example 745 77 99
    # Example 245 07 00
    # Example 726 29 05
    #
    def short_phone_number
      Faker.numerify('###-##-##')
    end

    # Generates a mobile phone number
    # Example 70 745 77 99
    # Example 76 245 07 00
    # Example 77 726 29 05
    #
    def mobile_number
      "#{mobile_phone_prefix}-#{short_phone_number}"
    end

    # Generates a home or work phone number
    # Example 33 845 77 99
    # Example 33 945 07 00
    # Example 33 906 29 05
    #
    def homework_number
      "#{homework_phone_prefix}-#{[8, 9][rand(1)]}#{Faker.numerify('##-##-##')}"
    end

    # Generates a random phone number mobile or home or work
    #
    def phone_number
      case rand(10)
      when 0 then homework_number
      when 9 then homework_number
      when 3 then mobile_number
      when 5 then mobile_number
      when 6 then mobile_number
      when 8 then mobile_number
      else        homework_number
      end
    end
  end
end
