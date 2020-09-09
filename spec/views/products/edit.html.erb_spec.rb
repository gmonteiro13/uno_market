# require 'rails_helper'

# RSpec.describe "products/edit", type: :view do
#   before(:each) do
#     @product = assign(:product, Product.create!(
#       product_name: "MyString",
#       category: "MyString",
#       description: "MyString",
#       price: 1,
#       user: nil
#     ))
#   end

#   it "renders the edit product form" do
#     render

#     assert_select "form[action=?][method=?]", product_path(@product), "post" do

#       assert_select "input[name=?]", "product[product_name]"

#       assert_select "input[name=?]", "product[category]"

#       assert_select "input[name=?]", "product[description]"

#       assert_select "input[name=?]", "product[price]"

#       assert_select "input[name=?]", "product[user_id]"
#     end
#   end
# end
