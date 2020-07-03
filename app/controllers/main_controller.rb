class MainController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :choose_song, :record, :mix]

  def index
  end

  def dashboard
    @recordings = [
      {
        url: 'recordingurl.mp3',
        title: 'Birlinn',
        recorded_date: Time.now.strftime('%c')
      }
    ]
  end

  def choose_song
  end

  def record
  end

  def mix
  end


end
