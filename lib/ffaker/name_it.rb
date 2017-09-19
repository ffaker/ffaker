# encoding: utf-8

module FFaker
  # Author microspino<info@microspino.com> github.com/microspino
  module NameIT
    extend ModuleUtils
    extend self

    PREFIX = %w[Sig. Sig.ra Sig.na Dr. Dott. Dott.ssa Prof. Prof.ssa].freeze

    # randomized? (ITALIAN)  prefix!
    #
    def prefix
      fetch_sample(PREFIX)
    end

    def last_name
      fetch_sample(LAST_NAMES)
    end

    def first_name
      fetch_sample(FIRST_NAMES)
    end

    def name
      case rand(0..9)
      when 5, 7 then "#{prefix} #{first_name} #{last_name}"
      else        "#{first_name} #{last_name}"
      end
    end
  end
end
