require 'rails_helper'

RSpec.describe "backing_tracks/index", type: :view do
  before(:each) do
    assign(:backing_tracks, [
      BackingTrack.create!(
        song_title: "Song Title",
        song_part: "Song Part",
        user: nil
      ),
      BackingTrack.create!(
        song_title: "Song Title",
        song_part: "Song Part",
        user: nil
      )
    ])
  end

  it "renders a list of backing_tracks" do
    render
    assert_select "tr>td", text: "Song Title".to_s, count: 2
    assert_select "tr>td", text: "Song Part".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
