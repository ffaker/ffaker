module Faker
  module NameCN
    extend ModuleUtils
    extend self

    def name
      "#{first_name}#{last_name}"
    end

    def first_name
      FIRST_NAMES.rand
    end

    def last_name
      LAST_NAMES.rand
    end

    FIRST_NAMES = k %w(赵 钱 孙 李 王 曹 贺 罗 朱 江 毛)
      

    LAST_NAMES = k %w( 小明 大明 小刚 小叶 文 华 小飞)

  end
end
