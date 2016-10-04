# encoding: utf-8

module FFaker
  # Author microspino<info@microspino.com> github.com/microspino
  module NameIT
    extend ModuleUtils
    extend self

    PREFIX = %w(Sig. Sig.ra Sig.na Dr. Dott. Dott.ssa Prof. Prof.ssa).freeze

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
      case rand(10)
      when 7 then "#{prefix} #{first_name} #{last_name}"
      when 5 then "#{prefix} #{first_name} #{last_name}"
      when 3 then "#{first_name} #{last_name}"
      when 0 then "#{first_name} #{last_name}"
      else        "#{first_name} #{last_name}"
      end
    end
  end
end
