class MovieService
  REGEXP_GET_YOUTUBE_ID = %r{.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*}.freeze
  YOUTUBE_LINK_FORMAT = %r{\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*}.freeze
  attr_accessor :youtube_url

  def initialize(youtube_url)
    @youtube_url = youtube_url
  end

  def infor
    youtube_movie = Yt::Video.new id: youtube_id
    {
      youtube_id: youtube_movie.id,
      title: youtube_movie.title,
      description: youtube_movie.description
    }
  rescue StandardError => e
    if e.instance_of? Yt::Errors::NoItems
      {
        title: ''
      }
    end
  end

  private

  def youtube_id
    REGEXP_GET_YOUTUBE_ID.match(youtube_url)[1] if youtube_url.present? && youtube_url =~ YOUTUBE_LINK_FORMAT
  end
end
