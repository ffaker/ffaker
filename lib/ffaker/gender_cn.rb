# encoding: utf-8

module FFaker
  module GenderCN
    extend ModuleUtils
    extend self

    GENDERS = %w(男 女)

    def random
      GENDERS.sample
    end

    alias_method :maybe, :random
    alias_method :sample, :random
  end
end
