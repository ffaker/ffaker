module FFaker
  # Author: Luilver<luilver@gmail.com>
  # Based on information from http://en.wikipedia.org/wiki/Telephone_numbers_in_Cuba
  module PhoneNumberCU
    extend ModuleUtils
    extend self

    # Mobile prefixes
    MobileOperatorsPrefix = %w[05].freeze

    # Home or Work Operator prefixes
    HomeWorkOperatorsPrefix = %w[021 022 023 024 031 032 033 041 042 043 045 046 047 048 07].freeze

    OperatorsPrefix = MobileOperatorsPrefix + HomeWorkOperatorsPrefix

    # Return a prefix in MobileOperatorsPrefix
    # @see FFaker::PhoneNumberCU::MobileOperatorsPrefix
    #
    def mobile_phone_prefix
      fetch_sample(MobileOperatorsPrefix)
    end

    # Return a prefix in HomeWorkOperatorsPrefix
    # @see FFaker::PhoneNumberCU::HomeWorkOperatorsPrefix
    #
    def home_work_phone_prefix
      fetch_sample(HomeWorkOperatorsPrefix)
    end

    def phone_prefix
      fetch_sample(OperatorsPrefix)
    end

    # Generates a general phone number
    # (0x) xxx xxxx or (0xx) xx xxxx
    #
    def home_work_phone_number
      phone_prefix = home_work_phone_prefix
      case phone_prefix.size
      when 2 then FFaker.numerify("(#{phone_prefix}) ### ####")
      when 3 then FFaker.numerify("(#{phone_prefix}) ## ####")
      end
    end

    # Generates a mobile phone number
    # 05 xxx xxxx
    #
    def mobile_phone_number
      FFaker.numerify("#{mobile_phone_prefix} ### ####")
    end

    # Generates general number
    #
    def general_phone_number
      case rand(0..1)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    # Country Code is E.164 Country Code
    #
    def country_code
      e164_country_code
    end

    # International formats
    #
    def international_country_code
      case rand(0..1)
      when 0 then "00#{country_code}"
      when 1 then "+#{country_code}"
      end
    end

    def international_mobile_phone_number
      FFaker.numerify("#{international_country_code}#{mobile_phone_prefix[1]} ### ####")
    end

    def international_home_work_phone_number
      phone_prefix = home_work_phone_prefix
      case phone_prefix.size
      when 2 then FFaker.numerify("#{international_country_code}#{phone_prefix[1]} ### ####")
      when 3 then FFaker.numerify("#{international_country_code}#{phone_prefix[1, 2]} ## ####")
      end
    end

    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    # E.164 formats
    # Based on information from http://en.wikipedia.org/wiki/E.164
    #
    def e164_country_code
      '53'
    end

    def e164_mobile_phone_number
      FFaker.numerify("#{country_code}#{mobile_phone_prefix[1]}#######")
    end

    def e164_home_work_phone_number
      phone_prefix = home_work_phone_prefix
      case phone_prefix.size
      when 2 then FFaker.numerify("#{e164_country_code}#{phone_prefix[1]}#######")
      when 3 then FFaker.numerify("#{e164_country_code}#{phone_prefix[1, 2]}######")
      end
    end

    def e164_phone_number
      case rand(0..1)
      when 0 then e164_mobile_phone_number
      when 1 then e164_home_work_phone_number
      end
    end

    # Generates phone number
    #
    def phone_number
      case rand(0..2)
      when 0 then general_phone_number
      when 1 then international_phone_number
      when 2 then e164_phone_number
      end
    end
  end
end
