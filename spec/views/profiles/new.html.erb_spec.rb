require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      full_name: "MyString",
      social_name: "MyString",
      job: "MyString",
      department: "MyString"
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[full_name]"

      assert_select "input[name=?]", "profile[social_name]"

      assert_select "input[name=?]", "profile[job]"

      assert_select "input[name=?]", "profile[department]"
    end
  end
end
