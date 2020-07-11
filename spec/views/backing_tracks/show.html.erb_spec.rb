require 'rails_helper'

RSpec.describe "backing_tracks/show", type: :view do
  before(:each) do
    @backing_track = assign(:backing_track, BackingTrack.create!(
      song_title: "Song Title",
      song_part: "Song Part",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Song Title/)
    expect(rendered).to match(/Song Part/)
    expect(rendered).to match(//)
  end
end
