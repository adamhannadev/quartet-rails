class BackingTracksController < ApplicationController
  before_action :set_backing_track, only: [:show, :edit, :update, :destroy]

  # GET /backing_tracks
  # GET /backing_tracks.json
  def index
    @backing_tracks = BackingTrack.all
  end

  # GET /backing_tracks/1
  # GET /backing_tracks/1.json
  def show
  end

  # GET /backing_tracks/new
  def new
    @backing_track = BackingTrack.new
  end

  # GET /backing_tracks/1/edit
  def edit
  end

  # POST /backing_tracks
  # POST /backing_tracks.json
  def create
    @backing_track = BackingTrack.new(backing_track_params)

    respond_to do |format|
      if @backing_track.save
        format.html { redirect_to @backing_track, notice: 'Backing track was successfully created.' }
        format.json { render :show, status: :created, location: @backing_track }
      else
        format.html { render :new }
        format.json { render json: @backing_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backing_tracks/1
  # PATCH/PUT /backing_tracks/1.json
  def update
    respond_to do |format|
      if @backing_track.update(backing_track_params)
        format.html { redirect_to @backing_track, notice: 'Backing track was successfully updated.' }
        format.json { render :show, status: :ok, location: @backing_track }
      else
        format.html { render :edit }
        format.json { render json: @backing_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backing_tracks/1
  # DELETE /backing_tracks/1.json
  def destroy
    @backing_track.destroy
    respond_to do |format|
      format.html { redirect_to backing_tracks_url, notice: 'Backing track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backing_track
      @backing_track = BackingTrack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def backing_track_params
      params.require(:backing_track).permit(:song_title, :song_part, :user_id, :track)
    end
end
