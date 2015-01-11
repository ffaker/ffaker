# encoding: utf-8

module FFaker
  module Conference
    extend ModuleUtils
    extend self

    def name
      CONFERENCE_LIST.rand
    end
  end
end
