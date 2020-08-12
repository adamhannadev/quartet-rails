require 'rails_helper'

RSpec.describe "mixes/edit", type: :view do
  before(:each) do
    @mix = assign(:mix, Mix.create!(
      user: nil
    ))
  end

  it "renders the edit mix form" do
    render

    assert_select "form[action=?][method=?]", mix_path(@mix), "post" do

      assert_select "input[name=?]", "mix[user_id]"
    end
  end
end
