require 'rails_helper'

RSpec.describe "mixes/new", type: :view do
  before(:each) do
    assign(:mix, Mix.new(
      user: nil
    ))
  end

  it "renders new mix form" do
    render

    assert_select "form[action=?][method=?]", mixes_path, "post" do

      assert_select "input[name=?]", "mix[user_id]"
    end
  end
end
