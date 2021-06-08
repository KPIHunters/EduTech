require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/State Ibge/)
    expect(rendered).to match(/County Ibge/)
    expect(rendered).to match(/Full Address/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/Company Fantasy Name/)
    expect(rendered).to match(/Company Legal Name/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Gov/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
