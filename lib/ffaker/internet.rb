# encoding: utf-8

module FFaker
  module Internet
    extend ModuleUtils
    extend self

    BYTE = [*'0'..'255'].freeze
    HOSTS = %w[gmail.com yahoo.com hotmail.com].freeze
    DISPOSABLE_HOSTS = %w[mailinator.com suremail.info spamherelots.com binkmail.com safetymail.info].freeze
    DOMAIN_SUFFIXES = %w[co.uk com us ca biz info name].freeze
    SAFE_DOMAIN_SUFFIXES = %w[org com net].freeze
    SLUG_DELIMITERS = %w[- _ .].freeze
    MAC_LIMIT = 281_474_976_710_655

    def email(name = nil)
      [user_name(name), domain_name].join('@')
    end

    # returns an email address of an online disposable email service (like tempinbox.com).
    # you can really send an email to these addresses an access it by going to the service web pages.
    def disposable_email(name = nil)
      [user_name(name), fetch_sample(DISPOSABLE_HOSTS)].join('@')
    end

    def free_email(name = nil)
      "#{user_name(name)}@#{fetch_sample(HOSTS)}"
    end

    def safe_email(name = nil)
      "#{user_name(name)}@example.#{fetch_sample(SAFE_DOMAIN_SUFFIXES)}"
    end

    def user_name(name = nil)
      if name
        parts = shuffle(name.scan(/\w+/)).join(fetch_sample(%w[. _]))
        parts.downcase
      else
        case rand(0..1)
        when 0
          sanitize(Name.first_name)
        when 1
          [Name.first_name, Name.last_name].map { |n| sanitize(n) }.join(fetch_sample(%w[. _]))
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
      fetch_sample(DOMAIN_SUFFIXES)
    end

    def uri(protocol)
      "#{protocol}://#{domain_name}"
    end

    def http_url
      uri('http')
    end

    def ip_v4_address
      (1..4).map { fetch_sample(BYTE) }.join('.')
    end

    def slug(words = nil, glue = nil)
      words ||= Lorem.words(2).join(' ')
      glue ||= fetch_sample(SLUG_DELIMITERS)
      words.downcase.gsub(/[^a-z0-9]+/, glue)
    end

    def password(min_length = 8, max_length = 16)
      length =
        min_length > max_length ? min_length : fetch_sample([*min_length..max_length])
      String.from_regexp(/[a-z]{#{length}}/)
    end

    def mac(delimiter = ':')
      rand(0...MAC_LIMIT).to_s(16).rjust(12, '0').scan(/.{2}/).join(delimiter)
    end

    private

    def sanitize(string)
      string.gsub(/\W/, '').downcase
    end
  end
end
