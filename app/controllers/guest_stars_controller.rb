class GuestStarsController < ApplicationController
  before_action :set_guest_star, only: [:edit, :update, :destroy]

  # GET /guest_stars
  # GET /guest_stars.json
  def index
    @guest_stars = GuestStar.all.sort_by { |star| star.name }
  end

  # GET /guest_stars/1
  # GET /guest_stars/1.json
  def show
    @guest_star = GuestStar.find_by_name(params[:name])
    @series = Appearance.by_guest_star(@guest_star.name).all_series.sort_by { |series| series.series_title }
    @series_title = params[:series_title] || @series.first.series_title
    @appearances = Appearance.by_guest_star(@guest_star.name).by_series(@series_title)
    @other_guest_stars = Appearance.by_series(@series_title).all_guest_stars
    @other_stars = @other_guest_stars.map  do |star|
        star if star['name'] != @guest_star.name
      end
    @other_stars.delete(nil)
  end

  # GET /guest_stars/new
  def new
    @guest_star = GuestStar.new
  end

  # GET /guest_stars/1/edit
  def edit
  end

  # POST /guest_stars
  # POST /guest_stars.json
  def create
    @guest_star = GuestStar.new(guest_star_params)

    respond_to do |format|
      if @guest_star.save
        format.html { redirect_to @guest_star, notice: 'Guest star was successfully created.' }
        format.json { render :show, status: :created, location: @guest_star }
      else
        format.html { render :new }
        format.json { render json: @guest_star.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guest_stars/1
  # PATCH/PUT /guest_stars/1.json
  def update
    respond_to do |format|
      if @guest_star.update(guest_star_params)
        format.html { redirect_to @guest_star, notice: 'Guest star was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest_star }
      else
        format.html { render :edit }
        format.json { render json: @guest_star.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guest_stars/1
  # DELETE /guest_stars/1.json
  def destroy
    @guest_star.destroy
    respond_to do |format|
      format.html { redirect_to guest_stars_url, notice: 'Guest star was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest_star
      @guest_star = GuestStar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_star_params
      params.require(:guest_star).permit(:name, :image)
    end
end
