require 'rails_helper'

RSpec.describe "oauth_configs/show", type: :view do
  before(:each) do
    @oauth_config = assign(:oauth_config, OAuthConfig.create!(
      provider: "Provider",
      provider_app_id: "Provider App",
      provider_app_secret: "Provider App Secret",
      scope: "Scope"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Provider/)
    expect(rendered).to match(/Provider App/)
    expect(rendered).to match(/Provider App Secret/)
    expect(rendered).to match(/Scope/)
  end
end
