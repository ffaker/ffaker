# encoding: utf-8

module  Faker
  # Based on information from http://en.wikipedia.org/wiki/Telephone_numbers_in_Singapore
  module PhoneNumberSG
    extend ModuleUtils
    extend self

    # Number Ranges
    # 3xxx xxxx - Voice Over IP services
    # 6xxx xxxx - Fixed Line services inclusive of Fixed Line Voice Over IP services
    #                        like StarHub Digital Voice and SingTel mio Voice
    # 8xxx xxxx - Mobile phone services
    # 9xxx xxxx - Mobile phone services Includes Paging Services like SUNPAGE
    # 800 xxx xxxx - Toll-Free International services
    # 1800 xxx xxxx - Toll-Free line services
    # 1900 xxx xxxx - Premium Service

    # Generates a voip phone number
    #  3xxx xxxx
    #
    def voip_number
      Faker.numerify("3### ####")
    end

    # Generates a fixed line phone number
    #  6xxx xxxx
    #
    def fixed_line_number 
      Faker.numerify("6### ####")
    end

    # Generates a fixed mobile phone number
    #  8xxx xxxx
    #
    def mobile_number
      Faker.numerify("8### ####")
    end

    # Generates a fixed mobile phone number or pager service number
    #  9xxx xxxx
    #
    def mobile_or_pager_number
      Faker.numerify("9### ####")
    end

    # Generates an international toll-free number
    #  800 xxx xxxx
    #
    def international_toll_free_number
      Faker.numerify("800 ### ####")
    end

    # Generates an toll-free number
    #  1800 xxx xxxx
    #
    def toll_free_number
      Faker.numerify("1800 ### ####")
    end

    # Generates a premium service number
    #  (1900) xxx xxxx
    #
    def premium_service_number
      Faker.numerify("1900 ### ####")
    end

    # generates mobile or home/work number
    def phone_number
      case rand(3)
      when 0 then fixed_line_number
      when 1 then mobile_number
      when 2 then mobile_or_pager_number
      end
    end

    def country_code
      "+65"
    end
  end
end
