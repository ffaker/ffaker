# frozen_string_literal: true

module FFaker
  module PhoneNumberGB
    extend ModuleUtils
    extend self

    # Mobile prefixes are in the 071xx, 073xx, 074xx, 075xx, 07624, 077xx, 078xx and 079xx ranges
    def mobile_prefix(leading_zero = true)
      mobile_prefix = %w[71 73 74 75 7624 77 78 79][FFaker::Random.rand(0..7)]
      mobile_prefix += FFaker.numerify('##') unless mobile_prefix.length == 4
      mobile_prefix = "0#{mobile_prefix}" if leading_zero
      mobile_prefix
    end

    def region_prefix(leading_zero = true)
      # The region prefix affects the length and format of the subscriber number
      # so we just use a small subset of possible area codes here for simplicity
      # when generating the subscriber number.
      region_prefix = %w[20 29 113 116 121 151 1382 1386 1865 1204 15396 16977][FFaker::Random.rand(0..11)]
      region_prefix = "0#{region_prefix}" if leading_zero
      region_prefix
    end

    def phone_number
      home_work_phone_number
    end

    def mobile_phone_number(leading_zero = true)
      [mobile_prefix(leading_zero), FFaker.numerify('#######')].join(' ')
    end

    def home_work_phone_number(leading_zero = true)
      region = region_prefix(leading_zero)

      region_for_comparison = region.delete_prefix('0')
      subscriber_number = ''
      case region_for_comparison
      when '20'
        subscriber_number = "#{%w[3 4 7 8][FFaker::Random.rand(0..3)]}#{FFaker.numerify('### ####')}"
      when '29'
        subscriber_number = "2#{FFaker.numerify('### ####')}"
      when '113', '116', '121', '151'
        subscriber_number = "#{FFaker::Random.rand(0..4)}#{FFaker.numerify('## ####')}"
      when '1382', '1386', '1865', '1204'
        subscriber_number = FFaker.numerify('######')
      when '15396', '16977'
        subscriber_number = FFaker.numerify('#####')
      else
        raise "Unexpected region prefix #{region_for_comparison}"
      end

      [region, subscriber_number].join(' ')
    end

    def country_code
      '+44'
    end

    def international_mobile_phone_number
      [country_code, mobile_phone_number(false)].join(' ')
    end

    def international_home_work_phone_number
      [country_code, home_work_phone_number(false)].join(' ')
    end

    def international_phone_number
      international_home_work_phone_number
    end
  end
end
