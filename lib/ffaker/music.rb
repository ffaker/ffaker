# encoding: utf-8

module FFaker
  module Music
    extend ModuleUtils
    extend self

    def genre
      fetch_sample(GENRES)
    end

    def album
      fetch_sample(ALBUMS)
    end

    def artist
      fetch_sample(ARTISTS)
    end

    def song
      fetch_sample(SONGS)
    end
  end
end
