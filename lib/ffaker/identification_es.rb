# encoding: utf-8

module Faker
  module IdentificationES
    extend ModuleUtils
    extend self

    GENDERS = %w(Hombre Mujer)

    def gender
      GENDERS.sample
    end
  end
end
