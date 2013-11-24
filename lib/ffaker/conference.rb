# encoding: utf-8

module Faker
  module Conference
    extend ModuleUtils
    extend self

    def name
      CONFERENCE_LIST.rand
    end
  end
end
