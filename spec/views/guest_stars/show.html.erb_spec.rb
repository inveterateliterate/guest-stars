require 'rails_helper'

RSpec.describe "guest_stars/show", type: :view do
  before(:each) do
    @guest_star = assign(:guest_star, GuestStar.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :image => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(//)
  end
end
