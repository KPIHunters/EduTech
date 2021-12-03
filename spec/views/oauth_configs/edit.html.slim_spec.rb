require 'rails_helper'

RSpec.describe "oauth_configs/edit", type: :view do
  before(:each) do
    @oauth_config = assign(:oauth_config, OAuthConfig.create!(
      provider: "MyString",
      provider_app_id: "MyString",
      provider_app_secret: "MyString",
      scope: "MyString"
    ))
  end

  it "renders the edit oauth_config form" do
    render

    assert_select "form[action=?][method=?]", oauth_config_path(@oauth_config), "post" do

      assert_select "input[name=?]", "oauth_config[provider]"

      assert_select "input[name=?]", "oauth_config[provider_app_id]"

      assert_select "input[name=?]", "oauth_config[provider_app_secret]"

      assert_select "input[name=?]", "oauth_config[scope]"
    end
  end
end
