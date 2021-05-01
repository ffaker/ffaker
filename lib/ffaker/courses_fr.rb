# frozen_string_literal: true

module FFaker
  module CoursesFR
    module Mathematiques
      extend ModuleUtils
      extend self

      def lesson
        fetch_sample(LESSONS)
      end
    end

    module Philosophie
      extend ModuleUtils
      extend self

      def lesson
        fetch_sample(LESSONS)
      end
    end
  end
end
