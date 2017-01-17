require 'httparty'
require 'uri'

module MovieData
    # @@api_key = ENV['TMDB_API_KEY']
    BASE_URL = "https://api.themoviedb.org/3/"
    API_KEY = "api_key=#{ENV['TMDB_API_KEY']}"

  def self.search_for(search_type, query_term)
    HTTParty.get(BASE_URL + "search/#{search_type}?query=#{URI.encode(query_term)}&" + API_KEY)["results"][0]
  end

  def self.get_imdb_id(search_type, query_term)
    results = search_for(search_type, query_term)
    results["id"]
  end

  #Genres
  def self.get_genre_list
    HTTParty.get(BASE_URL + "genre/tv/list?" + API_KEY)["genres"]
  end

  def self.get_genre(genre_list, genre_id)
    genre_list.each do |g|
      if g["id"] == genre_id
        @genre = g["name"]
        break
      end
    end
    @genre
  end

  #Episodes
  def self.get_seasons(series_title)
    series_imdb_id = get_imdb_id("tv", series_title)
    HTTParty.get(BASE_URL + "tv/#{series_imdb_id}?" + API_KEY)["number_of_seasons"]
  end

  def self.get_episodes(series_name, season_num)
    series_imdb_id = get_imdb_id("tv", series_name)
    HTTParty.get(BASE_URL + "tv/#{series_imdb_id}/season/#{season_num}?" + API_KEY)["episodes"]
  end

  #Actors
  def self.get_guest_stars(query_term)
    star = search_for("person", query_term)
    #update
    star["id"]
  end
end

#Examples of using the API
  #https://api.themoviedb.org/3/movie/76341?api_key={api_key}
  #https://api.themoviedb.org/3/tv/1408/season/1/episode/1?api_key=#{my_api_key}")["guest_stars"]
  # https://api.themoviedb.org/3/search/movie?api_key={my_api_key}&query=Jack+Reacher
  # https://api.themoviedb.org/3/tv/3?api_key=my_api_key&language=en-US


