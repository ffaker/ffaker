module Faker
  module Internet
    extend ModuleUtils
    extend self

    def email(name = nil)
      [ user_name(name), domain_name ].join('@')
    end

    # returns an email address of an online disposable email service (like tempinbox.com).
    # you can really send an email to these addresses an access it by going to the service web pages.
    def disposable_email(name = nil)
      [ user_name(name), DISPOSABLE_HOSTS.rand ].join('@')
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

    def uri(protocol)
      "#{protocol}://#{domain_name}"
    end

    def http_url
      uri("http")
    end

    def ip_v4_address
      (1..4).map { BYTE.random_pick(1) }.join(".")
    end

    BYTE = k((0..255).to_a.map { |n| n.to_s })
    HOSTS = k %w(gmail.com yahoo.com hotmail.com)
    DISPOSABLE_HOSTS = k %w(mailinator.com suremail.info spamherelots.com binkmail.com safetymail.info)
    DOMAIN_SUFFIXES = k %w(co.uk com us uk ca biz info name)
  end
end
