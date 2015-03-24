# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressCA
    include FFaker::Address

    extend ModuleUtils
    extend self

    POSTAL_CODE_FORMAT = '?#? #?#'
    POSTAL_CODE_CHARS = %w(A B C E G H J K L M N P R S T V X Y)
    PROVINCE_ABBRS = %w(NL NS PE NB QC ON MB SK AB BC YT NT NU)

    def postal_code
      FFaker.numerify(POSTAL_CODE_FORMAT.gsub("?") { POSTAL_CODE_CHARS.sample })
    end

    def province
      PROVINCE.sample
    end

    def city
      CITY.sample
    end

    def province_abbr
      PROVINCE_ABBRS.sample
    end
  end
end
