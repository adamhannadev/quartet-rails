require 'rails_helper'

RSpec.describe "mixes/show", type: :view do
  before(:each) do
    @mix = assign(:mix, Mix.create!(
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
