# encoding: utf-8

module Faker
  module Guid
    extend ModuleUtils
    extend self

    def guid
      Faker.hexify('########-####-####-####-############')
    end
  end
end
