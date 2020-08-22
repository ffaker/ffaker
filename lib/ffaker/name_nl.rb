# frozen_string_literal: true

module FFaker
  module NameNL
    include FFaker::Name

    extend ModuleUtils
    extend self

    PREFIXES = %w[Dr. Drs. Ir. Ing. Prof.].freeze

    def name
      case rand(0..29)
      when 0 then "#{prefix} #{first_name} #{last_name}"
      else        "#{first_name} #{last_name}"
      end
    end

    def first_name
      case rand(0..1)
      when 0 then first_name_female
      when 1 then first_name_male
      end
    end

    def first_name_female
      case rand(0..7)
      when 0 then [fetch_sample(FIRST_NAMES_FEMALE), fetch_sample(FIRST_NAMES_FEMALE)].join('-')
      else fetch_sample(FIRST_NAMES_FEMALE)
      end
    end

    def first_name_male
      case rand(0..7)
      when 0 then [fetch_sample(FIRST_NAMES_MALE), fetch_sample(FIRST_NAMES_MALE)].join('-')
      else fetch_sample(FIRST_NAMES_MALE)
      end
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def prefix
      fetch_sample(PREFIXES)
    end
  end
end
