require 'rails_helper'

RSpec.describe "recordings/index", type: :view do
  before(:each) do
    assign(:recordings, [
      Recording.create!(
        user: nil,
        part: "Part",
        title: "Title"
      ),
      Recording.create!(
        user: nil,
        part: "Part",
        title: "Title"
      )
    ])
  end

  it "renders a list of recordings" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Part".to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
