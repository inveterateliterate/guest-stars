class Episode < ApplicationRecord
  belongs_to :series
  has_many :appearances, dependent: :destroy

  scope :season, -> (season_num) { where(season_number: season_num) if season_num.present? }
  scope :sorted, -> { order("season_number ASC").order("episode_number ASC") }
  scope :episode_by_series, -> (series_id) { where(series_id: series_id) }

  def self.find_episode(series_id, episode_title)
    episodes = Episode.episode_by_series(series_id)
    episodes.find_by_episode_title(episode_title).id
  end
end
