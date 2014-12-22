require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :subsection_id => 1,
      :image => "Image",
      :title => "Title",
      :sku => "Sku",
      :range => "Range",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Image/)
    rendered.should match(/Title/)
    rendered.should match(/Sku/)
    rendered.should match(/Range/)
    rendered.should match(/Description/)
  end
end
