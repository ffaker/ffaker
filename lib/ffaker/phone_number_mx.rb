# encoding: utf-8

module FFaker
  # Author: guapolo github.com/guapolo
  module PhoneNumberMX
    extend ModuleUtils
    extend self

    # Generates a general phone number
    #  xx xxxx xxxx
    #
    def home_work_phone_number
      FFaker.numerify('## #### ####')
    end

    # Generates a mobile phone number
    # 044 xx xxxx xxxx
    #
    def mobile_phone_number
      FFaker.numerify('044 ## #### ####')
    end

    # generates mobile or home/work number
    def phone_number
      case rand(0..1)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def country_code
      '+52'
    end

    def international_mobile_phone_number
      FFaker.numerify("#{country_code} 1 ## #### ####")
    end

    def international_home_work_phone_number
      FFaker.numerify("#{country_code} ## #### ####")
    end

    def international_phone_number
      case rand(0..1)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    # Generates a toll-free number
    #  01 800 xxx xxxx
    #
    def toll_free_number
      FFaker.numerify('01 800 ### ####')
    end
  end
end
