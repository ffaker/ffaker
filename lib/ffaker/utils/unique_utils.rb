# frozen_string_literal: true

require 'set'

module FFaker
  class UniqueUtils
    def initialize(generator, max_retries)
      @generator = generator
      @max_retries = max_retries
      @previous_results = Hash.new { |hash, key| hash[key] = Set.new }
    end

    def method_missing(name, *arguments)
      @generator.respond_to?(name) ? add_results_to_hash(name, *arguments) : super
    end

    def respond_to_missing?(method_name, include_private = false)
      super
    end

    RetryLimitExceeded = Class.new(StandardError)

    def clear
      @previous_results.clear
    end

    def self.clear
      ObjectSpace.each_object(self, &:clear)
    end

    private

    def add_results_to_hash(name, *arguments)
      @max_retries.times do
        result = @generator.send(name, *arguments)

        next if @previous_results[[name, arguments]].include?(result)

        @previous_results[[name, arguments]] << result
        return result
      end
      raise RetryLimitExceeded
    end
  end
end
