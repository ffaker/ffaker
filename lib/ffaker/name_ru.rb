# encoding: utf-8
module Faker
  module NameRU
    include Faker::Name
    extend ModuleUtils
    extend self
    
    def name
      case rand(2)
      when 0 then "#{last_name} #{first_name} #{patronymic}"
      else        "#{first_name} #{last_name}"
      end
    end
    
    def first_name
      FIRST_NAMES.rand
    end
    
    def last_name
      LAST_NAMES.rand
    end
    
    def patronymic
      PATRONYMICS.rand
    end
    
    FIRST_NAMES = k %w(Александр Алексей Василий Иван Максим Павел)
    
    LAST_NAMES = k %w(Петров Иванов Козлодоев Пупкин)
    
    PATRONYMICS = k %w(Антонович Александрович Алексеевич Васильевич Иванович Максимович Павлович)
  end
end
