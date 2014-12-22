require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :subsection_id => 1,
        :image => "Image",
        :title => "Title",
        :sku => "Sku",
        :range => "Range",
        :description => "Description"
      ),
      stub_model(Product,
        :subsection_id => 1,
        :image => "Image",
        :title => "Title",
        :sku => "Sku",
        :range => "Range",
        :description => "Description"
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Range".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
