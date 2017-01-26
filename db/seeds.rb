# series = ["How I Met Your Mother"]
genres = MovieData.get_genre_list
actors = ["Julia Roberts"]
# actors = ["Michael Weston", "Elizabeth Banks", "Ryan Reynolds", "Megan Mullally", "Martin Starr"]

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
        episode_number: episode["episode_number"],
        season_number: episode["season_number"],
        episode_summary: episode["overview"],
        series_id: series_id
      }
    end
    seasons_array.push(episodes_array)
  end
end
Episode.create(seasons_array.flatten)

#Add Actors

actors_array = actors.map do |actor|
  {
    name: actor,
    image: MovieData.get_image_pathname(actor)
  }
end
GuestStar.create(actors_array)

#Add Appearances
appearances_array = []
actors.each do |actor|
  guest_star_id = GuestStar.find_by_name(actor).id
  credits = MovieData.get_tv_credits(actor)
  credit_ids = []
  credits.each do |credit|
    if series.include?(credit["name"])
      credit_ids.push(credit["credit_id"])
    end
  end
  credit_ids.each do |credit_id|
    appearances = MovieData.get_appearances(credit_id)
    series_id = Series.find_by_series_title(appearances["name"]).id
    character = appearances["character"]
    episodes = appearances["episodes"]
    series_appearances_array = episodes.map do |episode|
      {
        guest_star_id: guest_star_id,
        series_id: series_id,
        character: character,
        episode_id: Episode.find_episode(series_id, episode["name"])
      }
    end
    appearances_array.push(series_appearances_array)
  end
end
Appearance.create(appearances_array.flatten)
