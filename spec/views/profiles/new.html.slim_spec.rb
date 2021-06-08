require 'rails_helper'

RSpec.describe "profiles/new", type: :view do
  before(:each) do
    assign(:profile, Profile.new(
      full_name: "MyString",
      phone: "MyString",
      state_ibge: "MyString",
      county_ibge: "MyString",
      full_address: "MyString",
      zip_code: "MyString",
      company_fantasy_name: "MyString",
      company_legal_name: "MyString",
      website: "MyString",
      gov_id: "MyString",
      description: "MyString",
      user: nil
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input[name=?]", "profile[full_name]"

      assert_select "input[name=?]", "profile[phone]"

      assert_select "input[name=?]", "profile[state_ibge]"

      assert_select "input[name=?]", "profile[county_ibge]"

      assert_select "input[name=?]", "profile[full_address]"

      assert_select "input[name=?]", "profile[zip_code]"

      assert_select "input[name=?]", "profile[company_fantasy_name]"

      assert_select "input[name=?]", "profile[company_legal_name]"

      assert_select "input[name=?]", "profile[website]"

      assert_select "input[name=?]", "profile[gov_id]"

      assert_select "input[name=?]", "profile[description]"

      assert_select "input[name=?]", "profile[user_id]"
    end
  end
end
