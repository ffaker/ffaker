# encoding: utf-8

require 'ffaker/address'

module FFaker
  module AddressUA
    extend ModuleUtils
    extend self

    POSTAL_CODE_FORMAT        = ['#####'].freeze
    BUILDING_NUMBER_FORMATS   = %w[## # ###].freeze
    APPARTMENT_NUMBER_FORMATS = %w[# ## ###].freeze

    def country
      fetch_sample(COUNTRY)
    end

    def city
      fetch_sample(CITY)
    end

    def province
      fetch_sample(PROVINCE)
    end

    def zip_code
      numerify_mask(POSTAL_CODE_FORMAT, true)
    end

    def street_name
      "вул. #{fetch_sample(STREET)}"
    end

    def street_address(include_secondary = false)
      str = "#{street_name}, #{building_number}"
      str << ", кв. #{appartment_number}" if include_secondary
      str
    end

    def building_number
      numerify_mask(BUILDING_NUMBER_FORMATS)
    end

    def appartment_number
      numerify_mask(APPARTMENT_NUMBER_FORMATS)
    end

    private

    def numerify_mask(masks_arr, allow_first_zero = false)
      if allow_first_zero
        FFaker.numerify(masks_arr)
      else
        fetch_sample(masks_arr).sub(/#/) { rand(1..9).to_s }.gsub(/#/) { rand(0..9).to_s }
      end
    end
  end
end
