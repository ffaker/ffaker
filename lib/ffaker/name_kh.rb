module FFaker
  module NameKH
    extend ModuleUtils
    extend self

    def name
      "#{last_name} #{first_name}"
    end

    def last_name
      LAST_NAMES.sample
    end

    def first_name
      FIRST_NAMES.sample
    end

    def nick_name
      NICK_NAMES.sample
    end
  end
end
