# require 'rails_helper'

# RSpec.describe "products/index", type: :view do
#   before(:each) do
#     assign(:products, [
#       Product.create!(
#         product_name: "Product Name",
#         category: "Category",
#         description: "Description",
#         price: 2,
#         user: nil
#       ),
#       Product.create!(
#         product_name: "Product Name",
#         category: "Category",
#         description: "Description",
#         price: 2,
#         user: nil
#       )
#     ])
#   end

#   it "renders a list of products" do
#     render
#     assert_select "tr>td", text: "Product Name".to_s, count: 2
#     assert_select "tr>td", text: "Category".to_s, count: 2
#     assert_select "tr>td", text: "Description".to_s, count: 2
#     assert_select "tr>td", text: 2.to_s, count: 2
#     assert_select "tr>td", text: nil.to_s, count: 2
#   end
# end
