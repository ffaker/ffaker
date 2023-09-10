# frozen_string_literal: true

require 'set'

module FFaker
  class UniqueUtils
    RetryLimitExceeded = Class.new(StandardError)

    class << self
      def add_instance(generator, max_retries)
        instances[generator] ||= FFaker::UniqueUtils.new(generator, max_retries)
      end

      def instances
        Thread.current[:ffaker_unique_utils] ||= {}
      end

      def clear
        instances.each_value(&:clear)
        instances.clear
      end
    end

    def initialize(generator, max_retries)
      @generator = generator
      @max_retries = max_retries
    end

    def clear
      previous_results.clear
    end

    private

    def method_missing(name, *args, **kwargs)
      @max_retries.times do
        result = @generator.public_send(name, *args, **kwargs)

        next if previous_results[[name, args, kwargs]].include?(result)

        previous_results[[name, args, kwargs]] << result
        return result
      end

      raise RetryLimitExceeded, "Retry limit exceeded for #{name}"
    end

    def respond_to_missing?(name, *args)
      @generator.respond_to?(name, *args) || super
    end

    def previous_results
      @previous_results ||= Hash.new { |hash, key| hash[key] = Set.new }
    end
  end
end
