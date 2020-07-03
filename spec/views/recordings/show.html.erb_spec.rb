require 'rails_helper'

RSpec.describe "recordings/show", type: :view do
  before(:each) do
    @recording = assign(:recording, Recording.create!(
      user: nil,
      part: "Part",
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Part/)
    expect(rendered).to match(/Title/)
  end
end
