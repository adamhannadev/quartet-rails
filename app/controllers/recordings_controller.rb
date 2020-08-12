class RecordingsController < ApplicationController
  before_action :set_recording, only: [:show, :edit, :update, :destroy]

  # GET /recordings
  # GET /recordings.json
  def index
    @recordings = Recording.all
    @backing_tracks = BackingTrack.all.group("song_title")
  end

  # GET /recordings/1
  # GET /recordings/1.json
  def show
  end

  # GET /recordings/new
  def new
    @backing_tracks = BackingTrack.all.group("song_title")
    @recording = Recording.new
    @track = BackingTrack.where("song_title = ? AND song_part = ?", params[:title], params[:part]).first
  end

  def mix
    # GET /recordings/mix/:soprano/:alto/:tenor/:bass
    @recordings = Recording.all
    rec_files = []
    username = current_user.email.slice(0..(current_user.email.index('@')-1))
    @recordings.each do |r|
      f = r.rec_file
      f.open do |fl|
        cmd1 = `mkdir -pv temp/mixing/#{username}`
        cmd2 = `opusdec --force-wav #{fl.path} - | sox - temp/mixing/#{username}/#{username}-#{r.title}-#{r.part}.mp3`
      puts fl.path
      puts cmd1, cmd2
    end
    end
    cmd3 = `pwd && cd temp/mixing/#{username} && pwd && sox -m * mixed.mp3`
    puts cmd3
    
  end

  # GET /recordings/1/edit
  def edit
  end

  # POST /recordings
  # POST /recordings.json
  def create
    @recording = Recording.new(recording_params)
    @recording.user = current_user
    respond_to do |format|
      if @recording.save
        format.html { redirect_to @recording, notice: 'Recording was successfully created.' }
        format.json { render :show, status: :created, location: @recording }
      else
        format.html { render :new }
        format.json { render json: @recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recordings/1
  # PATCH/PUT /recordings/1.json
  def update
    respond_to do |format|
      if @recording.update(recording_params)
        format.html { redirect_to @recording, notice: 'Recording was successfully updated.' }
        format.json { render :show, status: :ok, location: @recording }
      else
        format.html { render :edit }
        format.json { render json: @recording.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recordings/1
  # DELETE /recordings/1.json
  def destroy
    @recording.destroy
    respond_to do |format|
      format.html { redirect_to recordings_url, notice: 'Recording was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recording
      @recording = Recording.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recording_params
      params.require(:recording).permit(:user_id, :part, :title, :rec_file)
    end
end
