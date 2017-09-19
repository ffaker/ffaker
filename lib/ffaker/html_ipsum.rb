# encoding: utf-8

module FFaker
  # Loosely based on http://html-ipsum.com/
  # Requires FFaker::Lorem module
  module HTMLIpsum
    extend ModuleUtils
    extend self

    def a(word_count = 2)
      "<a href=\"##{word}\" title=\"#{words(word_count).capitalize!}\">#{words(word_count).capitalize!}</a>"
    end

    def p(count = 3, options = {})
      options = { fancy: false, include_breaks: false }.merge(options)
      if options[:fancy]
        s = fancy_string(count, options[:include_breaks])
      else
        mode = options[:include_breaks] ? 'paragraphs' : 'paragraph'
        s = send(mode.to_sym, count)
      end
      content_tag_for(:p, s)
    end

    def dl(definitions = 2)
      content_tag_for :dl do |dl|
        definitions.times do
          dl << content_tag_for(:dt, words(1).capitalize!)
          dl << content_tag_for(:dd, paragraph(2))
        end
      end
    end

    def ul_short(items = 3)
      content_tag_for :ul do |ul|
        items.times do
          ul << content_tag_for(:li, sentence(2))
        end
      end
    end

    def ul_long(items = 3)
      content_tag_for :ul do |ul|
        items.times do
          ul << content_tag_for(:li, paragraph(2))
        end
      end
    end

    def ol_short(items = 3)
      content_tag_for :ol do |ol|
        items.times do
          ol << content_tag_for(:li, sentence(2))
        end
      end
    end

    def ol_long(items = 3)
      content_tag_for :ol do |ol|
        items.times do
          ol << content_tag_for(:li, paragraph(2))
        end
      end
    end

    def ul_links(items = 3)
      content_tag_for :ul do |ul|
        items.times do
          ul << content_tag_for(:li, a(1))
        end
      end
    end

    def table(rows = 3)
      content_tag_for(:table) do |table|
        table << content_tag_for(:thead) do |thead|
          thead << content_tag_for(:tr) do |tr|
            tr << content_tag_for(:th, word.capitalize)
            tr << content_tag_for(:th, word.capitalize)
            tr << content_tag_for(:th, word.capitalize)
            tr << content_tag_for(:th, word.capitalize)
          end
        end
        table << content_tag_for(:tbody) do |tbody|
          rows.times do
            tbody << content_tag_for(:tr) do |tr|
              tr << content_tag_for(:td, words(1).capitalize)
              tr << content_tag_for(:td, words(1).capitalize)
              tr << content_tag_for(:td, words(1).capitalize)
              tr << content_tag_for(:td, a)
            end
          end
        end
      end
    end

    def body
      body = content_tag_for(:h1, words(2).capitalize)
      rand(0..3).times do
        body << content_tag_for(:p, fancy_string)
      end
      body << table(rand(0..3))
      body << content_tag_for(:h2, words(2).capitalize)
      body << content_tag_for(:ol) do |ol|
        rand(0..3).times do
          ol << content_tag_for(:li, paragraph(1))
        end
      end
      body << content_tag_for(:blockquote) do |bq|
        bq << content_tag_for(:p, paragraphs(3))
      end
      body << content_tag_for(:h3, words(2).capitalize!)
      body << content_tag_for(:ul) do |ul|
        rand(0..3).times do
          ul << content_tag_for(:li, paragraph(1))
        end
      end
      body << content_tag_for(:pre) do |pre|
        pre << content_tag_for(:code) do |code|
          code << "
            ##{word} h1 a {
              display: block;
              width: 300px;
              height: 80px;
            }
          "
        end
      end
      body
    end

    def fancy_string(count = 3, include_breaks = false)
      sep = include_breaks ? '<br>' : ' '
      a = k([
        content_tag_for(:strong, words(2).capitalize!),
        content_tag_for(:em, paragraph),
        content_tag_for(:code, words(2)),
        (a 2).to_s
      ] + FFaker::Lorem.paragraphs(count))
      fetch_sample(a, count: count).join(sep)
    end

    private

    def content_tag_for(element, content = nil)
      element_content = if content
                          content
                        else
                          block_html = ''
                          yield(block_html)
                          block_html
                        end
      "<#{element}>#{element_content}</#{element}>"
    end

    def word
      FFaker::Lorem.word
    end

    def words(word_count = 3)
      FFaker::Lorem.words(word_count).join(' ')
    end

    def sentence(word_count = 3)
      FFaker::Lorem.sentence(word_count)
    end

    def sentences(sentence_count = 3)
      FFaker::Lorem.sentences(sentence_count).join(' ')
    end

    def paragraph(sentence_count = 3)
      FFaker::Lorem.paragraph(sentence_count)
    end

    def paragraphs(paragraph_count = 3)
      FFaker::Lorem.paragraphs(paragraph_count).join('<br>')
    end
  end
end
