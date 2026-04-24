# frozen_string_literal: true

module FFaker
  class RetryUtils
    class RetryLimitExceeded < StandardError
    end

    def initialize(generator, condition, max_retries)
      @generator = generator
      @condition = condition
      @max_retries = max_retries
    end

    private

    def method_missing(name, *args, **kwargs)
      @max_retries.times do
        result = @generator.public_send(name, *args, **kwargs)
        return result if @condition.call(result)
      end

      raise RetryLimitExceeded, "Retry limit exceeded for #{name}"
    end

    def respond_to_missing?(name, include_all = false)
      @generator.respond_to?(name, include_all) || super
    end
  end
end
