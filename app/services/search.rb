module Search

  def self.query(query)
    if Series.find_by_series_title(query)
      return 'series'
    elsif GuestStar.find_by_name(query)
      return 'guest star'
    end
  end
end


