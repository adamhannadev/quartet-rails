require "rails_helper"

RSpec.describe "/dashboard" do
  it "displays the user's email" do
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
    sign_in user
    
    render

    expect(rendered).to match 'adam.s.hanna@gmail.com'
  end
end