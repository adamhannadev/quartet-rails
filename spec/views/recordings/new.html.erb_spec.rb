require 'rails_helper'

RSpec.describe "recordings/new", type: :view do
  before(:each) do
    assign(:recording, Recording.new(
      user: nil,
      part: "MyString",
      title: "MyString"
    ))
  end

  it "renders new recording form" do
    render

    assert_select "form[action=?][method=?]", recordings_path, "post" do

      assert_select "input[name=?]", "recording[user_id]"

      assert_select "input[name=?]", "recording[part]"

      assert_select "input[name=?]", "recording[title]"
    end
  end
end
