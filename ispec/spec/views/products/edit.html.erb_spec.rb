require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :subsection_id => 1,
      :image => "MyString",
      :title => "MyString",
      :sku => "MyString",
      :range => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_subsection_id[name=?]", "product[subsection_id]"
      assert_select "input#product_image[name=?]", "product[image]"
      assert_select "input#product_title[name=?]", "product[title]"
      assert_select "input#product_sku[name=?]", "product[sku]"
      assert_select "input#product_range[name=?]", "product[range]"
      assert_select "input#product_description[name=?]", "product[description]"
    end
  end
end