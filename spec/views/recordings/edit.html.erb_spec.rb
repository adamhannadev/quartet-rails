require 'rails_helper'

RSpec.describe "recordings/edit", type: :view do
  before(:each) do
    @recording = assign(:recording, Recording.create!(
      user: nil,
      part: "MyString",
      title: "MyString"
    ))
  end

  it "renders the edit recording form" do
    render

    assert_select "form[action=?][method=?]", recording_path(@recording), "post" do

      assert_select "input[name=?]", "recording[user_id]"

      assert_select "input[name=?]", "recording[part]"

      assert_select "input[name=?]", "recording[title]"
    end
  end
end
