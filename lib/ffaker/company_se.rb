# encoding: utf-8

module FFaker
  module CompanySE
    extend ModuleUtils
    extend self

    SUFFIXES = %w[AB Aktiebolag Ab].freeze

    def name
      case rand(0..3)
      when 0 then "#{NameSE.last_name} #{suffix}"
      when 1 then "#{NameSE.last_name}-#{NameSE.last_name}"
      when 2 then "#{NameSE.last_name}-#{NameSE.last_name} #{suffix}"
      when 3 then "#{NameSE.last_name}, #{NameSE.last_name} och #{NameSE.last_name}"
      end
    end

    def suffix
      fetch_sample(SUFFIXES)
    end
  end
end
