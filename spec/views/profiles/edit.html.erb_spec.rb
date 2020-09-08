# require 'rails_helper'

# RSpec.describe "profiles/edit", type: :view do
#   before(:each) do
#     @profile = assign(:profile, Profile.create!(
#       full_name: "MyString",
#       social_name: "MyString",
#       job: "MyString",
#       department: "MyString"
#     ))
#   end

#   it "renders the edit profile form" do
#     render

#     assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

#       assert_select "input[name=?]", "profile[full_name]"

#       assert_select "input[name=?]", "profile[social_name]"

#       assert_select "input[name=?]", "profile[job]"

#       assert_select "input[name=?]", "profile[department]"
#     end
#   end
# end
