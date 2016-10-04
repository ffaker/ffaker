# encoding: utf-8

module FFaker
  module Conference
    extend ModuleUtils
    extend self

    def name
      fetch_sample(CONFERENCE_LIST)
    end
  end
end
