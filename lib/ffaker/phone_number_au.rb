# encoding: utf-8

module FFaker
  # Author: wiseleyb<wiseleyb@gmail.com>
  # Based on information from http://en.wikipedia.org/wiki/Telephone_numbers_in_Australia
  module PhoneNumberAU
    extend ModuleUtils
    extend self

    # Mobile prefixes
    MobileOperatorsPrefix = %w[04 05].freeze

    # Home or Work Operator prefixes
    HomeWorkOperatorsPrefix = %w[02 03 07 08].freeze

    OperatorsPrefix = MobileOperatorsPrefix + HomeWorkOperatorsPrefix

    # Return a prefix in MobileOperatorsPrefix
    # @see FFaker::PhoneNumberAU::MobileOperatorsPrefix
    #
    def mobile_phone_prefix
      fetch_sample(MobileOperatorsPrefix)
    end

    # Return a prefix in HomeWorkOperatorsPrefix
    # @see FFaker::PhoneNumberAU::HomeWorkOperatorsPrefix
    #
    def home_work_phone_prefix
      fetch_sample(HomeWorkOperatorsPrefix)
    end

    def phone_prefix
      fetch_sample(OperatorsPrefix)
    end

    # Generates a general phone number
    #  (0x) xxxx xxxx
    #
    def home_work_phone_number
      FFaker.numerify("(#{home_work_phone_prefix}) #### ####")
    end

    # Generates a mobile phone number
    # 04xx xxx xxx
    #
    def mobile_phone_number
      FFaker.numerify("#{mobile_phone_prefix}## ### ###")
    end

    # generates mobile or home/work number
    def phone_number
      case rand(0..1)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def country_code
      '+61'
    end

    def international_mobile_phone_number
      FFaker.numerify("#{country_code} #{mobile_phone_prefix[1]} #### ####")
    end

    def international_home_work_phone_number
      FFaker.numerify("#{country_code} #{home_work_phone_prefix[1]} #### ####")
    end

    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end
  end
end
