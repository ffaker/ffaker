# encoding: utf-8
module Faker
  module NameRU
    include Faker::Name
    extend ModuleUtils
    extend self
    
    @immutable_sex = false
    
    def name
      with_same_sex do
        case rand(2)
        when 0 then "#{last_name} #{first_name} #{patronymic}"
        else        "#{first_name} #{last_name}"
        end
      end
    end
    
    def last_name
      LAST_NAMES[sex].rand
    end
    
    def first_name
      FIRST_NAMES[sex].rand
    end
    
    def patronymic
      PATRONYMICS[sex].rand
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
    
    # all names generated inside the block will have the same sex
    def with_same_sex
      raise ArgumentError, 'You should pass with_same_sex a block' unless block_given?
      
      randomize_sex
      @immutable_sex = true
      result = yield
      @immutable_sex = false
      result
    end
  private
    def sex
      @immutable_sex ? @sex : randomize_sex
    end
    
    def randomize_sex
      @sex = case rand(2)
      when 0 then :male
      when 1 then :female
      end
    end
    randomize_sex
  end
end
