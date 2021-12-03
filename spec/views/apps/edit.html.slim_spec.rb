require 'rails_helper'

RSpec.describe "apps/edit", type: :view do
  before(:each) do
    @app = assign(:app, App.create!(
      name: "MyString",
      domain: "MyString",
      registrable: false,
      is_active: false,
      user: nil
    ))
  end

  it "renders the edit app form" do
    render

    assert_select "form[action=?][method=?]", app_path(@app), "post" do

      assert_select "input[name=?]", "app[name]"

      assert_select "input[name=?]", "app[domain]"

      assert_select "input[name=?]", "app[registrable]"

      assert_select "input[name=?]", "app[is_active]"

      assert_select "input[name=?]", "app[user_id]"
    end
  end
end
