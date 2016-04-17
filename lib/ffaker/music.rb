# encoding: utf-8

module FFaker
  module Music
    extend ModuleUtils
    extend self

    def genre
      GENRES.sample
    end

    def album
      ALBUMS.sample
    end

    def artist
      ARTISTS.sample
    end

    def song
      SONGS.sample
    end
  end
end
