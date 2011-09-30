# encoding: utf-8

module Faker
  
  module NameWf
        
    extend ModuleUtils
    extend self
    
    
    # Last Names
    #
    LAST_NAMES = k %w(ami aminata aminta arame alpha abou abdou abdourahmane )
    
    # Generates a random last name
    #
    def last_name
      LAST_NAMES.rand
    end
    
  end  
  
end
