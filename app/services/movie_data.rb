require 'httparty'
require 'uri'

module MovieData
    # @@api_key = ENV['TMDB_API_KEY']
    BASE_URL = "https://api.themoviedb.org/3/"
    API_KEY = "api_key=#{ENV['TMDB_API_KEY']}"

  def self.search_for(search_type, query_term)
    HTTParty.get(BASE_URL + "search/#{search_type}?query=#{URI.encode(query_term)}&" + API_KEY)["results"][0]
  end

  def self.get_id(search_type, query_term)
    search_for(search_type, series_title)["id"]
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
    series_imdb_id = search_for("tv", series_title)["id"]
    HTTParty.get(BASE_URL + "tv/#{series_imdb_id}?" + API_KEY)["number_of_seasons"]
  end

  def self.get_episodes(series_title, season_num)
    series_imdb_id = search_for("tv", series_title)["id"]
    HTTParty.get(BASE_URL + "tv/#{series_imdb_id}/season/#{season_num}?" + API_KEY)["episodes"]
  end

  #Actors
  # def self.get_guest_star(query_term)
  #   star_imdb_id = search_for("person", query_term)["id"]
  #   HTTParty.get(BASE_URL + "person/#{star_imdb_id}?" + API_KEY)
  # end

  def self.get_tv_credits(guest_star)
    star_imdb_id = search_for("person", guest_star)["id"]
    HTTParty.get(BASE_URL + "person/#{star_imdb_id}/tv_credits?" + API_KEY)["cast"]
  end

  def self.get_appearances(credit_id)
    HTTParty.get(BASE_URL + "credit/#{credit_id}?" + API_KEY)["media"]
  end
end
