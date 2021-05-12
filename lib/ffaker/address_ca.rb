# frozen_string_literal: true

require_relative 'address'

module FFaker
  module AddressCA
    include FFaker::Address

    extend ModuleUtils
    extend self

    POSTAL_CODE_FORMAT = '?#? #?#'
    POSTAL_CODE_CHARS = %w[A B C E G H J K L M N P R S T V X Y].freeze
    PROVINCE_ABBRS = %w[NL NS PE NB QC ON MB SK AB BC YT NT NU].freeze

    def postal_code
      FFaker.numerify(POSTAL_CODE_FORMAT.gsub('?') { fetch_sample(POSTAL_CODE_CHARS) })
    end

    def province
      fetch_sample(PROVINCE)
    end

    def city
      fetch_sample(CITY)
    end

    def province_abbr
      fetch_sample(PROVINCE_ABBRS)
    end
  end
end
