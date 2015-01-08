# encoding: utf-8

module Faker
  module CoursesFR

    module Mathematiques
      extend ModuleUtils
      extend self
      def lesson
        LESSONS.rand
      end
    end

    module Philosophie
      extend ModuleUtils
      extend self
      def lesson
        LESSONS.rand
      end
    end
  end
end
