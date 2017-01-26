class SearchController < ApplicationController

  def query
    if Search.query(params[:query]) === 'series'
      redirect_to series_path(params[:query])
    elsif Search.query(params[:query]) === 'guest star'
      redirect_to guest_star_path(params[:query])
    else
      redirect_to :back, :alert => "That search term can't be found. Please try again."
    end
  end

end
