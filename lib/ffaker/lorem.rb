module Faker
  # Based on Perl's Text::Lorem
  module Lorem
    extend ModuleUtils
    extend self

    def word
      WORDS.rand
    end

    def words(num = 3)
      WORDS.random_pick(num)
    end

    def sentence(word_count = 4)
      s = words(word_count + rand(6))
      s = s.join(' ')
      s.capitalize!
      "#{s}."
    end

    def sentences(sentence_count = 3)
      (1..sentence_count).map { sentence }
    end

    def paragraph(sentence_count = 3)
      sentences(sentence_count + rand(3)).join(' ')
    end

    def paragraphs(paragraph_count = 3)
      (1..paragraph_count).map { paragraph }
    end

    WORDS = k %w(alias consequatur aut perferendis sit voluptatem accusantium
      doloremque aperiam eaque ipsa quae ab illo inventore veritatis
      et quasi architecto beatae vitae dicta sunt explicabo aspernatur
      aut odit aut fugit sed quia consequuntur magni dolores eos qui
      ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor
      sit amet consectetur adipisci velit sed quia non numquam eius
      modi tempora incidunt ut labore et dolore magnam aliquam quaerat
      voluptatem ut enim ad minima veniam quis nostrum exercitationem
      ullam corporis nemo enim ipsam voluptatem quia voluptas sit
      suscipit laboriosam nisi ut aliquid ex ea commodi consequatur
      quis autem vel eum iure reprehenderit qui in ea voluptate velit
      esse quam nihil molestiae et iusto odio dignissimos ducimus qui
      blanditiis praesentium laudantium totam rem voluptatum deleniti
      atque corrupti quos dolores et quas molestias excepturi sint
      occaecati cupiditate non provident sed ut perspiciatis unde
      omnis iste natus error similique sunt in culpa qui officia
      deserunt mollitia animi id est laborum et dolorum fuga et harum
      quidem rerum facilis est et expedita distinctio nam libero
      tempore cum soluta nobis est eligendi optio cumque nihil impedit
      quo porro quisquam est qui minus id quod maxime placeat facere
      possimus omnis voluptas assumenda est omnis dolor repellendus
      temporibus autem quibusdam et aut consequatur vel illum qui
      dolorem eum fugiat quo voluptas nulla pariatur at vero eos et
      accusamus officiis debitis aut rerum necessitatibus saepe
      eveniet ut et voluptates repudiandae sint et molestiae non
      recusandae itaque earum rerum hic tenetur a sapiente delectus ut
      aut reiciendis voluptatibus maiores doloribus asperiores
      repellat)
  end
end
