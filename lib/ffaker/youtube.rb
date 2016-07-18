# encoding: utf-8

module FFaker
  module Youtube
    extend ModuleUtils
    extend self

    def url
      "www.youtube.com/watch?v=#{video_id}"
    end

    def share_url
      "youtu.be/#{video_id}"
    end

    def embed_url
      "www.youtube.com/embed/#{video_id}"
    end

    def video_id
      fetch_sample(VIDEO_IDS)
    end
  end
end
