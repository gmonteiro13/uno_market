# require 'rails_helper'

# RSpec.describe "profiles/index", type: :view do
#   before(:each) do
#     assign(:profiles, [
#       Profile.create!(
#         full_name: "Full Name",
#         social_name: "Social Name",
#         job: "Job",
#         department: "Department"
#       ),
#       Profile.create!(
#         full_name: "Full Name",
#         social_name: "Social Name",
#         job: "Job",
#         department: "Department"
#       )
#     ])
#   end

#   it "renders a list of profiles" do
#     render
#     assert_select "tr>td", text: "Full Name".to_s, count: 2
#     assert_select "tr>td", text: "Social Name".to_s, count: 2
#     assert_select "tr>td", text: "Job".to_s, count: 2
#     assert_select "tr>td", text: "Department".to_s, count: 2
#   end
# end
