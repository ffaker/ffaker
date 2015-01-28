# encoding: utf-8

module Faker
  module Internet
    extend ModuleUtils
    extend self

    BYTE = [*'0'..'255']
    HOSTS = %w(gmail.com yahoo.com hotmail.com)
    DISPOSABLE_HOSTS = %w(mailinator.com suremail.info spamherelots.com binkmail.com safetymail.info)
    DOMAIN_SUFFIXES = %w(co.uk com us ca biz info name)
    SLUG_DELIMITERS = %w[- _ .]

    def email(name = nil)
      [ user_name(name), domain_name ].join('@')
    end

    # returns an email address of an online disposable email service (like tempinbox.com).
    # you can really send an email to these addresses an access it by going to the service web pages.
    def disposable_email(name = nil)
      [ user_name(name), DISPOSABLE_HOSTS.sample ].join('@')
    end

    def free_email(name = nil)
      "#{user_name(name)}@#{HOSTS.sample}"
    end

    def safe_email(name = nil)
      [user_name(name), 'example.'+ %w[org com net].shuffle.first].join('@')
    end

    def user_name(name = nil)
      if name
        parts = ArrayUtils.shuffle(name.scan(/\w+/)).join(%w(. _).sample)
        parts.downcase
      else
        case rand(2)
        when 0
          Name.first_name.gsub(/\W/, '').downcase
        when 1
          parts = [ Name.first_name, Name.last_name ].map{|n| n.gsub(/\W/, '') }
          parts = parts.join(%w(. _).sample)
          parts.downcase
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
      DOMAIN_SUFFIXES.sample
    end

    def uri(protocol)
      "#{protocol}://#{domain_name}"
    end

    def http_url
      uri("http")
    end

    def ip_v4_address
      (1..4).map { BYTE.sample }.join(".")
    end

    def slug(words = nil, glue = nil)
      glue ||= SLUG_DELIMITERS.sample

      (words || Faker::Lorem::words(2).join(glue)).downcase
    end

    def password(min_length = 8, max_length = 16)
      temp = Lorem.words.join

      while temp.length < min_length
        temp += Lorem.word
      end
      if max_length > min_length && temp.length > max_length
        temp = temp.slice(0, max_length)
      end

      temp
    end
  end
end
