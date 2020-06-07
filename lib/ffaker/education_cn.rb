# frozen_string_literal: true

module FFaker
  module EducationCN
    extend ModuleUtils
    extend self

    DEGREE_PREFIX = %w[哲学 经济学 法学 教育学 文学 历史学 理学 工学 农学 医学].freeze
    DEGREE_SUFFIX = %w[学士 硕士 博士].freeze
    POSITION = %w[华南 华北 华东 华中 西南 西北 东北 东南 中国].freeze
    SCHOOL_UNI = %w[大学 学院].freeze

    def degree
      "#{fetch_sample(DEGREE_PREFIX)}#{fetch_sample(DEGREE_SUFFIX)}"
    end

    def major
      fetch_sample(MAJOR)
    end

    def location
      case rand(0..2)
      when 0 then fetch_sample(PROVINCE)
      when 1 then fetch_sample(CITY)
      when 2 then fetch_sample(POSITION)
      end
    end

    def school
      case rand(0..2)
      when 0 then "#{location}#{fetch_sample(SCHOOL_TYPE)}#{fetch_sample(SCHOOL_UNI)}"
      when 1 then "#{location}#{fetch_sample(SCHOOL_UNI)}"
      when 2 then "#{location}#{fetch_sample(SCHOOL_TYPE)}#{fetch_sample(SCHOOL_UNI)}#{fetch_sample(CITY)}分校"
      end
    end
  end
end
