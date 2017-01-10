require 'rails_helper'

RSpec.describe "series/show", type: :view do
  before(:each) do
    @series = assign(:series, Series.create!(
      :series_name => "Series Name",
      :genre => "Genre",
      :summary => "MyText",
      :rating => "Rating"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Series Name/)
    expect(rendered).to match(/Genre/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Rating/)
  end
end
