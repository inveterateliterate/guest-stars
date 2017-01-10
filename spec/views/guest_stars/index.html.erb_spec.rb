require 'rails_helper'

RSpec.describe "guest_stars/index", type: :view do
  before(:each) do
    assign(:guest_stars, [
      GuestStar.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :image => ""
      ),
      GuestStar.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :image => ""
      )
    ])
  end

  it "renders a list of guest_stars" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
