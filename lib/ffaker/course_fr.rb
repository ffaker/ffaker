# encoding: utf-8

module Faker
  module Courses

   module Mathematiques
      extend ModuleUtils
      extend self
      def lesson
        LESSONS.sample
      end
    end

    module Philosophie
      extend ModuleUtils
      extend self
      def lesson
        LESSONS.sample
      end
    end
  end
end
