class SeriesController < ApplicationController
  # before_action :set_series, only: [:edit, :update, :destroy]

  # GET /series
  # GET /series.json
  def index
    @series = Series.all.sort_by { |series| series.series_title }
  end

  # GET /series/1
  # GET /series/1.json
  def show
    @series = Series.find_by_series_title(params[:series_title])
    @num_of_seasons = MovieData.get_seasons(@series.series_title)
    season_num = params[:season] || 1
    @episodes = @series.episodes.season(season_num).sorted
    @guest_stars = Appearance.by_series(@series.series_title).all_guest_stars
  end

  # GET /series/new
  def new
    @series = Series.new
  end

  # GET /series/1/edit
  def edit
    @series = Series.find_by_series_title(params[:series_title])
  end

  # POST /series
  # POST /series.json
  def create
    @series = Series.new(series_params)

    respond_to do |format|
      if @series.save
        format.html { redirect_to @series, notice: 'Series was successfully created.' }
        format.json { render :show, status: :created, location: @series }
      else
        format.html { render :new }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to @series, notice: 'Series was successfully updated.' }
        format.json { render :show, status: :ok, location: @series }
      else
        format.html { render :edit }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    respond_to do |format|
      format.html { redirect_to series_index_url, notice: 'Series was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:series_title, :genre, :summary, :rating)
    end
end
