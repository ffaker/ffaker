# encoding: utf-8

module FFaker
  module Internet
    extend ModuleUtils
    extend self

    BYTE = [*"0".."255"]
    HOSTS = %w(gmail.com yahoo.com hotmail.com)
    DISPOSABLE_HOSTS = %w(mailinator.com suremail.info spamherelots.com binkmail.com safetymail.info)
    DOMAIN_SUFFIXES = %w(co.uk com us ca biz info name)
    SAFE_DOMAIN_SUFFIXES = %w[org com net]
    SLUG_DELIMITERS = %w[- _ .]

    def email(name = nil)
      [user_name(name), domain_name].join("@")
    end

    # returns an email address of an online disposable email service (like tempinbox.com).
    # you can really send an email to these addresses an access it by going to the service web pages.
    def disposable_email(name = nil)
      [user_name(name), DISPOSABLE_HOSTS.sample].join("@")
    end

    def free_email(name = nil)
      "#{user_name(name)}@#{HOSTS.sample}"
    end

    def safe_email(name = nil)
      "#{user_name(name)}@example.#{SAFE_DOMAIN_SUFFIXES.sample}"
    end

    def user_name(name = nil)
      if name
        parts = name.scan(/\w+/).shuffle.join(%w(. _).sample)
        parts.downcase
      else
        case rand(2)
        when 0
          sanitize(Name.first_name)
        when 1
          [Name.first_name, Name.last_name].
            map { |n| sanitize(n) }.
            join(%w(. _).sample)
        end
      end
    end

    def domain_name
      "#{domain_word}.#{domain_suffix}"
    end

    def domain_word
      dw = Company.name.split(" ").first
      dw.gsub!(/\W/, "")
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
      words ||= Lorem.words(2).join(" ")
      glue ||= SLUG_DELIMITERS.sample
      words.downcase.gsub(/[^a-z0-9]+/, glue)
    end

    def password(min_length = 8, max_length = 16)
      length =
        min_length > max_length ? min_length : [*min_length..max_length].sample
      String.from_regexp(/[a-z]{#{length}}/)
    end

    private

    def sanitize(string)
      string.gsub(/\W/, "").downcase
    end
  end
end
