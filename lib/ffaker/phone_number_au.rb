# encoding: utf-8

# => author: wiseleyb
# => email: wiseleyb@gmail.com
# based on information from http://en.wikipedia.org/wiki/Telephone_numbers_in_Australia
module  Faker
  module PhoneNumberAU
    extend ModuleUtils
    extend self

    # Prefixes from http://en.wikipedia.org/wiki/Telephone_numbers_in_Australia
    # 00 Emergency and International access
    # 01 Alternative phone services
    # 02 Geographic: Central East region (NSW, ACT)
    # 03 Geographic: South-east region (VIC, TAS)
    # 04 Digital Mobile services (GSM and 3G)
    # 05 Universal/Personal numberings
    # 07 Geographic: North-east region (QLD)
    # 08 Geographic: Central and West region (SA, NT, WA)
    # 1 Non-geographic numbers (mostly for domestic use only)

    # Mobile prefixes
    MobileOperatorsPrefix = %w(04)

    # Home or Work Operator prefixes
    HomeWorkOperatorsPrefix = %w(02 03 05 07 08)

    OperatorsPrefix = MobileOperatorsPrefix + HomeWorkOperatorsPrefix

    # Return a prefix in MobileOperatorsPrefix
    # @see Faker::PhoneNumberAU::MobileOperatorsPrefix
    #
    def mobile_phone_prefix
      MobileOperatorsPrefix[rand(MobileOperatorsPrefix.size)]
    end

    # Return a prefix in HomeWorkOperatorsPrefix
    # @see Faker::PhoneNumberAU::HomeWorkOperatorsPrefix
    #
    def home_work_phone_prefix
      HomeWorkOperatorsPrefix[rand(HomeWorkOperatorsPrefix.size)]
    end

    def phone_prefix
      OperatorsPrefix[rand(OperatorsPrefix.size)]
    end

    # Generates a general phone number
    #  (0x) xxxx xxxx
    #
    def home_work_phone_number
      Faker.numerify("(#{home_work_phone_prefix}) #### ####")
    end

    # Generates a mobile phone number
    # 04xx xxx xxx
    #
    def mobile_phone_number
      Faker.numerify("#{mobile_phone_prefix}## ### ###")
    end

    # generates mobile or home/work number
    def phone_number
      case rand(2)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def country_code
      "+61"
    end

    def international_mobile_phone_number
      Faker.numerify("#{country_code} #{mobile_phone_prefix[1]} #### ####")
    end

    def international_home_work_phone_number
      Faker.numerify("#{country_code} #{home_work_phone_prefix[1]} #### ####")
    end

    def international_phone_number
      case rand(2)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

  end
end
