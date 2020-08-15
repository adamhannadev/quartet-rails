class MixesController < ApplicationController
  before_action :set_mix, only: [:show, :edit, :update, :destroy]

  # GET /mixes
  # GET /mixes.json
  def index
    @mixes = Mix.all
  end

  # GET /mixes/1
  # GET /mixes/1.json
  def show
  end

  # GET /mixes/new
  def new
    @mix = Mix.new
  end

  # GET /mixes/1/edit
  def edit
  end

  # POST /mixes
  # POST /mixes.json
  def create
    @mix = Mix.new(mix_params)
    
    respond_to do |format|
      if @mix.save


        @recordings = @mix.recordings
        @username = current_user.username
        @random = rand(9000..10000)
        @recordings.each do |r|
          f = r.rec_file
          f.open do |fl|
            cmd1 = `mkdir -pv temp/mixing/#{@username}`
            cmd2 = `opusdec --force-wav #{fl.path} - | sox - temp/mixing/#{@username}/#{@username}-#{r.title}-#{r.part}.mp3`
          puts fl.path
          puts cmd1, cmd2
          end
        end 
        cmd3 = `pwd && cd temp/mixing/#{@username} && pwd && sox -m * #{@username}-#{@random}.mp3`
        puts cmd3
        @mix.mixed_file.attach(io: File.open(Dir.pwd + "/temp/mixing/#{@username}/#{@username}-#{@random}.mp3"), filename: "#{@username}-#{@random}.mp3")
        cmd4 = `pwd && rm -r temp/mixing/#{@username}`
        puts "The final directory path is - " + cmd4

        format.html { redirect_to @mix, notice: 'Mix was successfully created.' }
        format.json { render :show, status: :created, location: @mix }
      else
        format.html { render :new }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mixes/1
  # PATCH/PUT /mixes/1.json
  def update
    respond_to do |format|
      if @mix.update(mix_params)
        format.html { redirect_to @mix, notice: 'Mix was successfully updated.' }
        format.json { render :show, status: :ok, location: @mix }
      else
        format.html { render :edit }
        format.json { render json: @mix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mixes/1
  # DELETE /mixes/1.json
  def destroy
    @mix.destroy
    respond_to do |format|
      format.html { redirect_to mixes_url, notice: 'Mix was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mix
      @mix = Mix.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mix_params
      params.require(:mix).permit(:user_id, recording_ids: [])
    end
end
