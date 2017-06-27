# encoding: utf-8

module FFaker
  module Tweet
    extend ModuleUtils
    extend self

    # Options
    # num_hashtags:   How many hashtags (default: (skewed (40%) 1-4))
    # num_mentions:   How many mentions (default: (skewed (20% 1-2))
    # reply:          Add reply? (default: (random 10%)
    # body_length:    Target length (rand(20..140)) (will be <= target)
    def tweet(args = {})
      options = {
        num_hashtags: [0, rand(1..10) - 6].max,
        num_mentions: [0, rand(1..10) - 8].max,
        reply: (rand(1..10) == 1),
        body_length: rand(20..140)
      }.merge(args)

      my_reply = options[:reply] ? "#{mention} " : ''
      my_mentions = options[:num_mentions] > 0 ? "#{mentions(options[:num_mentions])} " : ''
      my_tags = tags(options[:num_hashtags])

      remaining = [
        options[:body_length],
        140 - (my_reply.size + my_mentions.size + my_tags.size)
      ].min

      "#{my_reply}#{body(remaining)}#{my_mentions}#{my_tags}"
    end

    def mention
      "@#{FFaker::Internet.user_name}"
    end

    def mentions(num = 2)
      mention_names = []
      num.times { mention_names << mention }
      mention_names.join(' ')
    end

    def body(required_length = 140)
      required_length = [required_length, 20].max
      body = ''
      prefix = ''
      until body.size > required_length
        body += "#{prefix}#{FFaker::Lorem.sentence}"
        prefix = ' '
      end
      body[required_length - 1] = '#'
      body.gsub(/\s\S*\#.*$/, '.')
    end

    def tags(num_tags = 2)
      fetch_sample(HASHTAG, count: num_tags).join(' ')
    end
  end
end
