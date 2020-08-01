# frozen_string_literal: true

module FFaker
  module Filesystem
    extend ModuleUtils
    extend self

    def extension
      fetch_sample(EXTENSION)
    end

    def mime_type
      fetch_sample(MIME_TYPE)
    end

    def directory(directory_separator = File::SEPARATOR)
      Lorem.words.join(directory_separator)
    end

    def file_name(dir = directory, name = Lorem.word.downcase,
                  ext = extension, directory_separator = File::SEPARATOR)
      "#{dir}#{directory_separator}#{name}.#{ext}"
    end
  end
end
