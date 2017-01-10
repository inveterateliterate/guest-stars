require 'rails_helper'

RSpec.describe "guest_stars/new", type: :view do
  before(:each) do
    assign(:guest_star, GuestStar.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :image => ""
    ))
  end

  it "renders new guest_star form" do
    render

    assert_select "form[action=?][method=?]", guest_stars_path, "post" do

      assert_select "input#guest_star_first_name[name=?]", "guest_star[first_name]"

      assert_select "input#guest_star_last_name[name=?]", "guest_star[last_name]"

      assert_select "input#guest_star_image[name=?]", "guest_star[image]"
    end
  end
end
