class Appearance < ApplicationRecord
  belongs_to :guest_star
  belongs_to :series
  belongs_to :episode

  scope :by_guest_star, -> (guest_star_name) { where(guest_star: GuestStar.find_by_name(guest_star_name)) }
  scope :by_series, -> (series_name) { where(series: Series.find_by_series_title(series_name)) }
  scope :all_series, -> { Series.find(distinct.pluck(:series_id)) }
  scope :all_guest_stars, -> { GuestStar.find(distinct.pluck(:guest_star_id)) }

end
