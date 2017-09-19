# encoding: utf-8

module FFaker
  module Filesystem
    extend ModuleUtils
    extend self

    SLUG_DELIMITERS = %w[- _ .].freeze

    def extension
      fetch_sample(EXTENSION)
    end

    def mime_type
      fetch_sample(MIME_TYPE)
    end

    def file_name(dir = nil, name = nil, ext = nil, directory_separator = '/')
      dir ||= Internet.slug
      name ||= Lorem.word.downcase
      ext ||= extension
      [dir, name].join(directory_separator) + ".#{ext}"
    end
  end
end
