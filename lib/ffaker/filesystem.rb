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

    def file_name(
      *args,
      dir: directory, name: Lorem.word.downcase, ext: extension, directory_separator: File::SEPARATOR
    )
      if args.any?
        warn "Positional arguments for Filesystem##{__method__} are deprecated. Please use keyword arguments."
        dir = args[0]
        name = args[1] if args.size > 1
        ext = args[2] if args.size > 2
        directory_separator = args[3] if args.size > 3
      end

      "#{dir}#{directory_separator}#{name}.#{ext}"
    end
  end
end
