# frozen_string_literal: true

module FFaker
  module CompanyJA
    extend ModuleUtils
    extend self

    TYPES = %w[株式会社 有限会社].freeze
    DETAILED_TYPES = %w[ホールディングス 建設 商業 書店 不動産 銀行 証券].freeze
    POSITIONS = %w[会長 社長 部長 課長 係長 社員 契約社員 派遣社員 アルバイト インターン].freeze

    def name
      case rand(0..2)
      when 0 then "#{NameJA.last_name}#{fetch_sample(TYPES)}"
      when 1 then "#{fetch_sample(TYPES)}#{NameJA.last_name}"
      when 2 then "#{NameJA.last_name}#{fetch_sample(DETAILED_TYPES)}"
      end
    end

    def position
      fetch_sample(POSITIONS)
    end
  end
end
