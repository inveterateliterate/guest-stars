require 'rails_helper'

RSpec.describe "series/index", type: :view do
  before(:each) do
    assign(:series, [
      Series.create!(
        :series_name => "Series Name",
        :genre => "Genre",
        :summary => "MyText",
        :rating => "Rating"
      ),
      Series.create!(
        :series_name => "Series Name",
        :genre => "Genre",
        :summary => "MyText",
        :rating => "Rating"
      )
    ])
  end

  it "renders a list of series" do
    render
    assert_select "tr>td", :text => "Series Name".to_s, :count => 2
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Rating".to_s, :count => 2
  end
end
