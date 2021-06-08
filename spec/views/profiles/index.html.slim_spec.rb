require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        full_name: "Full Name",
        phone: "Phone",
        state_ibge: "State Ibge",
        county_ibge: "County Ibge",
        full_address: "Full Address",
        zip_code: "Zip Code",
        company_fantasy_name: "Company Fantasy Name",
        company_legal_name: "Company Legal Name",
        website: "Website",
        gov_id: "Gov",
        description: "Description",
        user: nil
      ),
      Profile.create!(
        full_name: "Full Name",
        phone: "Phone",
        state_ibge: "State Ibge",
        county_ibge: "County Ibge",
        full_address: "Full Address",
        zip_code: "Zip Code",
        company_fantasy_name: "Company Fantasy Name",
        company_legal_name: "Company Legal Name",
        website: "Website",
        gov_id: "Gov",
        description: "Description",
        user: nil
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", text: "Full Name".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: "State Ibge".to_s, count: 2
    assert_select "tr>td", text: "County Ibge".to_s, count: 2
    assert_select "tr>td", text: "Full Address".to_s, count: 2
    assert_select "tr>td", text: "Zip Code".to_s, count: 2
    assert_select "tr>td", text: "Company Fantasy Name".to_s, count: 2
    assert_select "tr>td", text: "Company Legal Name".to_s, count: 2
    assert_select "tr>td", text: "Website".to_s, count: 2
    assert_select "tr>td", text: "Gov".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
