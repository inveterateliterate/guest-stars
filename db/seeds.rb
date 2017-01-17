series = ["Scrubs", "Once Upon a Time", "Law and Order", "House"s]
genres = MovieData.get_genre_list

#Add Series
show_array = series.map do |show|
  data = MovieData.search_for("tv", show)
  genre_id = data["genre_ids"][0]
  genre = MovieData.get_genre(genres, genre_id)
  {
    series_title: data["name"],
    genre: genre,
    summary: data["overview"]
  }
end

Series.create(show_array)

#Add Episodes
seasons_array = []
series.each do |series|
  num_of_seasons = (MovieData.get_seasons(series))
  series_id = Series.find_by_series_title(series).id
  num_of_seasons.times do |i|
    episodes = MovieData.get_episodes(series, i+1)
    episodes_array = episodes.map do |episode|
      {
        episode_title: episode["name"],
        episode_number: episode["episode_number"].to_i,
        season_number: episode["season_number"].to_i,
        episode_summary: episode["overview"],
        series_id: series_id
      }
    end
    seasons_array.push(episodes_array)
  end
end
Episode.create(seasons_array.flatten)
