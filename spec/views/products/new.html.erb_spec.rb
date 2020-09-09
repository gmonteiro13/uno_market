# require 'rails_helper'

# RSpec.describe "products/new", type: :view do
#   before(:each) do
#     assign(:product, Product.new(
#       product_name: "MyString",
#       category: "MyString",
#       description: "MyString",
#       price: 1,
#       user: nil
#     ))
#   end

#   it "renders new product form" do
#     render

#     assert_select "form[action=?][method=?]", products_path, "post" do

#       assert_select "input[name=?]", "product[product_name]"

#       assert_select "input[name=?]", "product[category]"

#       assert_select "input[name=?]", "product[description]"

#       assert_select "input[name=?]", "product[price]"

#       assert_select "input[name=?]", "product[user_id]"
#     end
#   end
# end
