# encoding: utf-8

module Faker
  module CompanySE
    extend ModuleUtils
    extend self

    SUFFIXES = %w(AB Aktiebolag Ab)

    def name
      case rand(3)
      when 0 then "#{NameSE.last_name} #{suffix}"
      when 1 then "#{NameSE.last_name}-#{NameSE.last_name}"
      when 1 then "#{NameSE.last_name}-#{NameSE.last_name} #{suffix}"
      when 2 then "#{NameSE.last_name}, #{NameSE.last_name} och #{NameSE.last_name}"
      end
    end

    def suffix
      SUFFIXES.sample
    end
  end
end
