require 'rails_helper'

RSpec.describe "series/edit", type: :view do
  before(:each) do
    @series = assign(:series, Series.create!(
      :series_name => "MyString",
      :genre => "MyString",
      :summary => "MyText",
      :rating => "MyString"
    ))
  end

  it "renders the edit series form" do
    render

    assert_select "form[action=?][method=?]", series_path(@series), "post" do

      assert_select "input#series_series_name[name=?]", "series[series_name]"

      assert_select "input#series_genre[name=?]", "series[genre]"

      assert_select "textarea#series_summary[name=?]", "series[summary]"

      assert_select "input#series_rating[name=?]", "series[rating]"
    end
  end
end
