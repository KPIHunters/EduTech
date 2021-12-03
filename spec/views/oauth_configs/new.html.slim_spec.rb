require 'rails_helper'

RSpec.describe "oauth_configs/new", type: :view do
  before(:each) do
    assign(:oauth_config, OAuthConfig.new(
      provider: "MyString",
      provider_app_id: "MyString",
      provider_app_secret: "MyString",
      scope: "MyString"
    ))
  end

  it "renders new oauth_config form" do
    render

    assert_select "form[action=?][method=?]", oauth_configs_path, "post" do

      assert_select "input[name=?]", "oauth_config[provider]"

      assert_select "input[name=?]", "oauth_config[provider_app_id]"

      assert_select "input[name=?]", "oauth_config[provider_app_secret]"

      assert_select "input[name=?]", "oauth_config[scope]"
    end
  end
end
