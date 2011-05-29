module Faker
  # Loosely based on http://html-ipsum.com/
  # Requires Faker::Lorem module
  module HTMLIpsum
    extend ModuleUtils
    extend self
    
    def a(word_count = 2)
      "<a href=\"##{word}\" title=\"#{words(word_count).capitalize!}\">#{words(word_count).capitalize!}</a>"
    end

    def p_long(word_count = 10)
      "<p>#{paragraphs word_count}</p>"
    end
    
    def p_medium(word_count = 6)
      "<p>#{paragraphs word_count}</p>"
    end
    
    def p(word_count = 3)
      "<p>#{paragraphs word_count}</p>"
    end
    
    def dl(definitions = 2)
      s = "<dl>"
      definitions.times do 
        s << "<dt>#{words(1).capitalize!}</dt><dd>#{paragraph 2}</dd>"
      end
      s << "</dl>"
    end
    
    def ul_short(items = 3)
      s = "<ul>"
      items.times do 
        s << "<li>#{sentence 2}</li>"
      end
      s << "</ul>"
    end
    
    def ul_long(items = 3)
      s = "<ul>"
      items.times do 
        s << "<li>#{paragraph 2}</li>"
      end
      s << "</ul>"
    end

    def ol_short(items = 3)
      s = "<ol>"
      items.times do 
        s << "<li>#{sentence 2}</li>"
      end
      s << "</ol>"
    end
    
    def ol_long(items = 3)
      s = "<ol>"
      items.times do 
        s << "<li>#{paragraph 2}</li>"
      end
      s << "</ol>"
    end
    
    def ul_links(items = 3)
      s = "<ul>"
      items.times do 
        s << "<li>#{a 1}</li>"
      end
      s << "</ul>"
    end
    
    def table(rows = 3)
      s = "<table>
      	<thead>
      		<tr>
      			<th>#{word.capitalize!}</th>
      			<th>#{word.capitalize!}</th>
      			<th>#{word.capitalize!}</th>
      			<th>#{word.capitalize!}</th>
      		</tr>
      	</thead>
      	<tbody>"
      rows.times do 
        s << "<tr>
    			<td>#{words(1).capitalize!}</td>
    			<td>#{words(1).capitalize!}</td>
    			<td>#{words(1).capitalize!}</td>
    			<td>#{a}</td>
    		</tr>"
      end
      s << "</tbody>
      </table>"
    end
    
    def body
      s = "<h1>#{words(2).capitalize!}</h1>"
      Random.new.rand(1..4).times do
        s << "<p><strong>#{words(2).capitalize!}</strong>. #{paragraph 3} <em>#{paragraph}</em> #{paragraph 2} #{words(3).capitalize!},  <code>#{words 2}</code>, #{words 4}. #{paragraph 3} #{a 2} #{words 4}.</p>"
      end
      s << table(Random.new.rand(1..4))
      s << "<h2>#{words(2).capitalize!}</h2>
      <ol>"
      Random.new.rand(1..4).times do
        s << "<li>#{paragraph 1}</li>"
      end
      s << "</ol>
      <blockquote><p>#{paragraphs 3}</p></blockquote>
      <h3>#{words(2).capitalize!}</h3>
      <ul>"
      Random.new.rand(1..4).times do
        s << "<li>#{paragraph 1}</li>"
      end
      s << "</ul>
      <pre><code>
      ##{word} h1 a { 
      	display: block; 
      	width: 300px; 
      	height: 80px; 
      }
      </code></pre>"
    end

  private
  
    def word
      Faker::Lorem::word
    end

    def words(word_count = 3)
      Faker::Lorem::words(word_count).join(' ')
    end

    def sentence(word_count = 3)
      Faker::Lorem::sentence(word_count)
    end

    def sentences(sentence_count = 3)
      Faker::Lorem::sentences(sentence_count).join(' ')
    end

    def paragraph(sentence_count = 3)
      Faker::Lorem::paragraph(sentence_count)
    end  

    def paragraphs(paragraph_count = 3)
      Faker::Lorem::paragraphs(paragraph_count).join('<br>')
    end  

  end 
end
