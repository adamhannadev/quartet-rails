require 'rails_helper'

RSpec.describe "backing_tracks/new", type: :view do
  before(:each) do
    assign(:backing_track, BackingTrack.new(
      song_title: "MyString",
      song_part: "MyString",
      user: nil
    ))
  end

  it "renders new backing_track form" do
    render

    assert_select "form[action=?][method=?]", backing_tracks_path, "post" do

      assert_select "input[name=?]", "backing_track[song_title]"

      assert_select "input[name=?]", "backing_track[song_part]"

      assert_select "input[name=?]", "backing_track[user_id]"
    end
  end
end
