require 'rails_helper'

RSpec.describe "apps/new", type: :view do
  before(:each) do
    assign(:app, App.new(
      name: "MyString",
      domain: "MyString",
      registrable: false,
      is_active: false,
      user: nil
    ))
  end

  it "renders new app form" do
    render

    assert_select "form[action=?][method=?]", apps_path, "post" do

      assert_select "input[name=?]", "app[name]"

      assert_select "input[name=?]", "app[domain]"

      assert_select "input[name=?]", "app[registrable]"

      assert_select "input[name=?]", "app[is_active]"

      assert_select "input[name=?]", "app[user_id]"
    end
  end
end
