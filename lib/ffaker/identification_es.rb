# encoding: utf-8

module Faker
  module IdentificationES
    extend ModuleUtils
    extend self

    def gender
      GENDERS.sample
    end

    GENDERS = k %w(Hombre Mujer)

  end
end
