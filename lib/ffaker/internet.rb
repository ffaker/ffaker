# frozen_string_literal: true

module FFaker
  module Internet
    extend ModuleUtils
    extend self

    BYTE = Array('0'..'255').freeze
    HOSTS = %w[gmail.com yahoo.com hotmail.com].freeze
    DISPOSABLE_HOSTS = %w[
      mailinator.com suremail.info spamherelots.com binkmail.com safetymail.info
    ].freeze
    DOMAIN_SUFFIXES = %w[co.uk com us ca biz info name].freeze
    SAFE_DOMAIN_SUFFIXES = %w[org com net].freeze
    SLUG_DELIMITERS = %w[- _ .].freeze
    MAC_LIMIT = 281_474_976_710_655

    def email(name = nil)
      [user_name(name), domain_name].join('@')
    end

    # returns an email address of an online disposable email service (like tempinbox.com).
    # you can really send an email to these addresses an access it by going to the
    # service web pages.
    def disposable_email(name = nil)
      [user_name(name), fetch_sample(DISPOSABLE_HOSTS)].join('@')
    end

    def free_email(name = nil)
      [user_name(name), fetch_sample(HOSTS)].join('@')
    end

    def safe_email(name = nil)
      [user_name(name), fetch_sample(SAFE_DOMAIN_SUFFIXES)].join('@example.')
    end

    def user_name(name = nil)
      return shuffle(name.split(' ')).join(fetch_sample(%w[. _])).downcase if name

      return sanitize(Name.first_name) if rand(0..1).zero?

      [sanitize(Name.first_name), sanitize(Name.last_name)].join(fetch_sample(%w[. _]))
    end

    def domain_name
      [domain_word, domain_suffix].join('.')
    end

    def domain_word
      sanitize(Company.name.split(' ').first)
    end

    def domain_suffix
      fetch_sample(DOMAIN_SUFFIXES)
    end

    def uri(protocol)
      [protocol, domain_name].join('://')
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
      length = min_length > max_length ? min_length : fetch_sample(min_length..max_length)
      String.from_regexp(/\w{#{length}}/)
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
