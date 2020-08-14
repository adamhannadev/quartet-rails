require 'rails_helper'

RSpec.describe "mixes/index", type: :view do
  before(:each) do
    assign(:mixes, [
      Mix.create!(
        user: nil
      ),
      Mix.create!(
        user: nil
      )
    ])
  end

  it "renders a list of mixes" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
