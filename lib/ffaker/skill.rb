module Faker
  module Skill
    extend ModuleUtils
    extend self

    def tech_skill
      TECH_SKILLS.rand
    end

    def tech_skills(num = 3)
      TECH_SKILLS.random_pick(num) 
    end

    def specialty
      "%s %s" % [SPECIALTY_START.rand, SPECIALTY_END.rand]
    end

    def specialties(num = 3)
      (1..num).map { specialty }
    end

    TECH_SKILLS = k %w(Ajax XHR AWS Bootstrap CodeIgniter
      CSS3 Django Git HTML5 JavaScript JQuery JSON LAMP
      Linux Mac OSX MongoDB MySQL Photoshop PHP Python
      REST Ruby Rails SublimeText SVN TextMate Cassandra
      Heroku Memcached PostgreSQL SOAP XML YAML
      Backbone.JS Marionette.JS CakePHP ExtJS Sinatra
      Struts Typo3 Zend ActionScript ASP Java JSP Perl
      Shell Flash Illustrator Visio Angular.JS)


    SPECIALTY_START = k %w(Web Database Resource Team
      Prototype Project Software Hardware Firmware Area
      Multi-tier Global Template Modular Statistical
      Visual Mental Performance)


    SPECIALTY_END = k %w(Development Management Design
      Architecture Methods Optimization Modularization
      Testing Profiling Prototyping Analysis Instruction
      Metrics Research)


  end
end
