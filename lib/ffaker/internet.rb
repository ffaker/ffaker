module Faker
  module Internet
    extend ModuleUtils
    extend self

    def email(name = nil)
      [ user_name(name), domain_name ].join('@')
    end

    def free_email(name = nil)
      "#{user_name(name)}@#{HOSTS.rand}"
    end

    def user_name(name = nil)
      if name
        parts = ArrayUtils.shuffle(name.scan(/\w+/)).join(ArrayUtils.rand(%w(. _)))
        parts.downcase!
        parts
      else
        case rand(2)
        when 0
          Name.first_name.gsub(/\W/, '').downcase
        when 1
          parts = [ Name.first_name, Name.last_name ].each {|n| n.gsub!(/\W/, '') }
          parts = parts.join ArrayUtils.rand(%w(. _))
          parts.downcase!
          parts
        end
      end
    end

    def domain_name
      "#{domain_word}.#{domain_suffix}"
    end

    def domain_word
      dw = Company.name.split(' ').first
      dw.gsub!(/\W/, '')
      dw.downcase!
      dw
    end

    def domain_suffix
      DOMAIN_SUFFIXES.rand
    end

    HOSTS = k %w(gmail.com yahoo.com hotmail.com)
    DOMAIN_SUFFIXES = k %w(co.uk com us uk ca biz info name)
  end
end
