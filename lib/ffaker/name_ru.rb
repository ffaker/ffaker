# encoding: utf-8
module Faker
  module NameRU
    include Faker::Name
    extend ModuleUtils
    extend self
    
    def name
      case rand(2)
      when 0 then @sex = :male
      when 1 then @sex = :female
      end
      
      case rand(2)
      when 0 then "#{last_name} #{first_name} #{patronymic}"
      else        "#{first_name} #{last_name}"
      end
    end
    
    def last_name
      LAST_NAMES[@sex].rand
    end
    
    def first_name
      FIRST_NAMES[@sex].rand
    end
    
    def patronymic
      PATRONYMICS[@sex].rand
    end
    
    LAST_NAMES = {
      :male   => k(%w(Петров Иванов Козлодоев Пупкин)),
      :female => k(%w(Петрова Иванова Козлодоева Пупкина))
    }
    
    FIRST_NAMES = {
      :male   => k(%w(Александр Алексей Василий Иван Максим Павел)),
      :female => k(%w(Александра Василиса Елена Ольга Наталья))
    }
    
    PATRONYMICS = {
      :male   => k(%w(Антонович Александрович Алексеевич Васильевич Иванович Максимович Павлович)),
      :female => k(%w(Антоновна Александровна Алексеевна Васильевна Ивановна Максимовна Павловна))
    }
  end
end
