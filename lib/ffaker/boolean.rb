# encoding: utf-8

module Faker
  module Boolean
    extend ModuleUtils
    extend self

    def maybe
      case rand(2)
      when 0 then true
      when 1 then false
      end
    end

    alias_method :random, :maybe
    alias_method :sample, :maybe
  end
end
