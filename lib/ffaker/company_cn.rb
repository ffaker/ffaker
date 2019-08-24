# frozen_string_literal: true

module FFaker
  module CompanyCN
    extend ModuleUtils
    extend self

    TYPES = %w[科技 食品 电器 教育 咨询 网络].freeze
    SUFFIXES = %w[有限公司 公司].freeze

    def name
      "#{NameCN.first_name}#{type}#{suffix}"
    end

    def type
      fetch_sample(TYPES)
    end

    def suffix
      fetch_sample(SUFFIXES)
    end
  end
end
