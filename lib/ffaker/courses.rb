module FFaker
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

   module Francais
     extend ModuleUtils
     extend self

     def lesson
     end
   end

  end
end
