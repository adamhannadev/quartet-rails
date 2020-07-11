require 'rails_helper'

RSpec.describe "backing_tracks/edit", type: :view do
  before(:each) do
    @backing_track = assign(:backing_track, BackingTrack.create!(
      song_title: "MyString",
      song_part: "MyString",
      user: nil
    ))
  end

  it "renders the edit backing_track form" do
    render

    assert_select "form[action=?][method=?]", backing_track_path(@backing_track), "post" do

      assert_select "input[name=?]", "backing_track[song_title]"

      assert_select "input[name=?]", "backing_track[song_part]"

      assert_select "input[name=?]", "backing_track[user_id]"
    end
  end
end
