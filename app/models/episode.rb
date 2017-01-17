class Episode < ApplicationRecord
  belongs_to :series
  has_many :appearances, dependent: :destroy

  scope :season, -> (season_num) { where(season_number: season_num) if season_num.present? }
  scope :sorted, -> { order("season_number ASC").order("episode_number ASC") }
end
