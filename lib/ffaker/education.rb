# encoding: utf-8

module FFaker
  module Education
    extend ModuleUtils
    extend self

    MAJOR_ADJ = %w[Business Systems Industrial Medical Financial Marketing Political Social] + ['Human Resource']
    SCHOOL_PREFIX = %w[Green South North Wind Lake Hill Lark River Red White].freeze
    SCHOOL_ADJ = %w[International Global Polytechnic National].freeze
    SCHOOL_TYPE = %w[School University College Institution Academy].freeze
    SCHOOL_UNI  = %w[University College].freeze

    def degree_short
      "#{fetch_sample(DEGREE_SHORT_PREFIX)} in #{major}"
    end

    def degree
      "#{fetch_sample(DEGREE_PREFIX)} in #{major}"
    end

    def major
      "#{fetch_sample(MAJOR_ADJ)} #{fetch_sample(MAJOR_NOUN)}"
    end

    def school_name
      fetch_sample(SCHOOL_PREFIX) + fetch_sample(SCHOOL_SUFFIX)
    end

    def school_generic_name
      case rand(0..1)
      when 0 then fetch_sample(AddressUS::STATE)
      when 1 then school_name
      end
    end

    def school
      case rand(0..4)
      when 0, 1 then
        "#{school_name} #{fetch_sample(SCHOOL_TYPE)}"
      when 2 then
        "#{school_generic_name} #{fetch_sample(SCHOOL_ADJ)} #{fetch_sample(SCHOOL_TYPE)}"
      when 3 then
        "#{fetch_sample(SCHOOL_UNI)} of #{school_generic_name}"
      when 4 then
        "#{school_generic_name} #{fetch_sample(SCHOOL_TYPE)} of #{fetch_sample(MAJOR_NOUN)}"
      end
    end
  end
end
