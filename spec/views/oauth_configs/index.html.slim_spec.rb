require 'rails_helper'

RSpec.describe "oauth_configs/index", type: :view do
  before(:each) do
    assign(:oauth_configs, [
      OAuthConfig.create!(
        provider: "Provider",
        provider_app_id: "Provider App",
        provider_app_secret: "Provider App Secret",
        scope: "Scope"
      ),
      OAuthConfig.create!(
        provider: "Provider",
        provider_app_id: "Provider App",
        provider_app_secret: "Provider App Secret",
        scope: "Scope"
      )
    ])
  end

  it "renders a list of oauth_configs" do
    render
    assert_select "tr>td", text: "Provider".to_s, count: 2
    assert_select "tr>td", text: "Provider App".to_s, count: 2
    assert_select "tr>td", text: "Provider App Secret".to_s, count: 2
    assert_select "tr>td", text: "Scope".to_s, count: 2
  end
end
