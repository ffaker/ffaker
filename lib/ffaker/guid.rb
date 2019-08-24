# frozen_string_literal: true

module FFaker
  module Guid
    extend ModuleUtils
    extend self

    def guid
      FFaker.hexify('########-####-####-####-############')
    end
  end
end
